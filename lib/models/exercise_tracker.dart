import 'package:feetly/controllers/exercise_form_provider.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';

enum ExerciseType {
  squat,
  calfRaise,
  heelStretch,
  singleLegStance,
  gluteBridge,
}

class Scenario {
  Scenario({
    required this.a,
    required this.b,
    this.c = null,
    required this.minAngle,
    required this.maxAngle,
    required this.errorMessage,
  });
  final PoseLandmarkType a;
  final PoseLandmarkType b;
  final PoseLandmarkType? c;
  final double minAngle;
  final double maxAngle;
  final String errorMessage;
}

class TransitionRequirements {
  TransitionRequirements({
    required this.successPath,
    this.alternatePath = null,
    required this.failPaths,
    required this.message,
    required this.currentPose,
  });
  final List<Scenario> successPath;
  final List<Scenario>? alternatePath;
  final List<Scenario> failPaths;
  String message;
  final String currentPose;
  String? errorMessage;

  int evaluateRequirments(Pose pose) {
    bool successPathSucceeded = true;
    for (Scenario scenario in successPath) {
      double angle = calculateAngle(
        pose.landmarks[scenario.a],
        pose.landmarks[scenario.b],
        scenario.c != null ? pose.landmarks[scenario.c] : null,
      );
      if (angle == -1) {
        // Landmark not found
        successPathSucceeded = false;
        break;
      }
      successPathSucceeded &=
          (angle >= scenario.minAngle && angle <= scenario.maxAngle);
    }

    if (!successPathSucceeded && alternatePath != null) {
      bool alternatePathSucceeded = true;
      for (Scenario scenario in alternatePath!) {
        double angle = calculateAngle(
          pose.landmarks[scenario.a],
          pose.landmarks[scenario.b],
          scenario.c != null ? pose.landmarks[scenario.c] : null,
        );
        if (angle == -1) {
          // Landmark not found
          alternatePathSucceeded = false;
          break;
        }
        alternatePathSucceeded &=
            (angle >= scenario.minAngle && angle <= scenario.maxAngle);
      }
      if (alternatePathSucceeded) successPathSucceeded = true;
    }

    bool fail = false;
    for (Scenario scenario in failPaths) {
      double angle = calculateAngle(
        pose.landmarks[scenario.a],
        pose.landmarks[scenario.b],
        scenario.c != null ? pose.landmarks[scenario.c] : null,
      );
      if (angle != -1 &&
          (angle <= scenario.minAngle || angle >= scenario.maxAngle)) {
        fail = true;
        errorMessage = scenario.errorMessage;
        break;
      }
    }
    return (fail) ? -1 : ((successPathSucceeded) ? 1 : 0);
  }

  double calculateAngle(PoseLandmark? a, PoseLandmark? b, PoseLandmark? c) {
    if (a == null || b == null) {
      return -1; // Indicate missing landmarks
    }

    final double result;
    if (c == null) {
      // Angle of the line segment with the horizontal axis
      result = atan2(a.y - b.y, a.x - b.x) * 180 / pi;
    } else {
      // Angle at vertex b using the law of cosines
      double ab = sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2));
      double bc = sqrt(pow(c.x - b.x, 2) + pow(c.y - b.y, 2));
      double ac = sqrt(pow(a.x - c.x, 2) + pow(a.y - c.y, 2));

      if (ab == 0 || bc == 0) return -1;

      double cosineAngle =
          (pow(ab, 2) + pow(bc, 2) - pow(ac, 2)) / (2 * ab * bc);
      // Clamp the value to the valid range for acos to avoid NaN errors
      cosineAngle = cosineAngle.clamp(-1.0, 1.0);
      result = acos(cosineAngle) * 180 / pi;
    }
    return result.abs();
  }
}

class ExerciseTracker {
  ExerciseTracker({
    required this.transitions,
    required this.importantLandmarks,
    required this.exerciseLength,
  });
  factory ExerciseTracker.fromType(ExerciseType type) {
    switch (type) {
      case ExerciseType.gluteBridge:
        return ExerciseTracker(
          exerciseLength: 2,
          importantLandmarks: {
            PoseLandmarkType.leftAnkle,
            PoseLandmarkType.rightAnkle,
            PoseLandmarkType.leftKnee,
            PoseLandmarkType.rightKnee,
            PoseLandmarkType.leftHip,
            PoseLandmarkType.rightHip,
            PoseLandmarkType.leftShoulder,
            PoseLandmarkType.rightShoulder,
          },
          transitions: [
            TransitionRequirements(
              successPath: [
                Scenario(
                  a: PoseLandmarkType.rightShoulder,
                  b: PoseLandmarkType.rightHip,
                  c: PoseLandmarkType.rightKnee,
                  minAngle: 150,
                  maxAngle: 180,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.leftShoulder,
                  b: PoseLandmarkType.leftHip,
                  c: PoseLandmarkType.leftKnee,
                  minAngle: 70,
                  maxAngle: 130,
                  errorMessage: "",
                ),
              ],
              alternatePath: [
                Scenario(
                  a: PoseLandmarkType.leftShoulder,
                  b: PoseLandmarkType.leftHip,
                  c: PoseLandmarkType.leftKnee,
                  minAngle: 150,
                  maxAngle: 180,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightShoulder,
                  b: PoseLandmarkType.rightHip,
                  c: PoseLandmarkType.rightKnee,
                  minAngle: 70,
                  maxAngle: 130,
                  errorMessage: "",
                ),
              ],
              failPaths: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 30,
                  maxAngle: 180,
                  errorMessage: "Your legs are too close to you",
                ),
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 0,
                  maxAngle: 140,
                  errorMessage: "Your legs aren't bent enough",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 30,
                  maxAngle: 180,
                  errorMessage: "Your legs are too close to you",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 0,
                  maxAngle: 140,
                  errorMessage: "Your legs aren't bent enough",
                ),
              ],
              message: "Thrust your hips, and raise a leg",
              currentPose: "Laying with bent legs",
            ),
            TransitionRequirements(
              successPath: [
                Scenario(
                  a: PoseLandmarkType.rightShoulder,
                  b: PoseLandmarkType.rightHip,
                  c: PoseLandmarkType.rightKnee,
                  minAngle: 80,
                  maxAngle: 140,
                  errorMessage: "",
                ),
              ],
              alternatePath: [
                Scenario(
                  a: PoseLandmarkType.leftShoulder,
                  b: PoseLandmarkType.leftHip,
                  c: PoseLandmarkType.leftKnee,
                  minAngle: 80,
                  maxAngle: 140,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightShoulder,
                  b: PoseLandmarkType.rightHip,
                  c: PoseLandmarkType.rightKnee,
                  minAngle: 70,
                  maxAngle: 130,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
              message: "Hold your position then descend to",
              currentPose: "Single Glute Bridge",
            ),
          ],
        );
      case ExerciseType.squat:
        return ExerciseTracker(
          exerciseLength: 2,
          importantLandmarks: {
            PoseLandmarkType.leftAnkle,
            PoseLandmarkType.rightAnkle,
            PoseLandmarkType.leftKnee,
            PoseLandmarkType.rightKnee,
            PoseLandmarkType.leftHip,
            PoseLandmarkType.rightHip,
            PoseLandmarkType.leftShoulder,
            PoseLandmarkType.rightShoulder,
          },
          transitions: [
            TransitionRequirements(
              message: "Lower your body into a squat",
              currentPose: "Standing",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 0,
                  maxAngle: 120,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 0,
                  maxAngle: 120,
                  errorMessage: "",
                ),
              ],
              failPaths: [
                Scenario(
                  a: PoseLandmarkType.leftShoulder,
                  b: PoseLandmarkType.leftHip,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 150,
                  maxAngle: 180,
                  errorMessage: "Keep your back straight",
                ),
              ],
            ),
            TransitionRequirements(
              currentPose: "Sqaut pose",
              message: "Return to a standing position",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 160,
                  maxAngle: 180,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 160,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
          ],
        );
      case ExerciseType.calfRaise:
        return ExerciseTracker(
          exerciseLength: 2,
          importantLandmarks: {
            PoseLandmarkType.leftAnkle,
            PoseLandmarkType.rightAnkle,
            PoseLandmarkType.leftFootIndex,
            PoseLandmarkType.rightFootIndex,
          },
          transitions: [
            TransitionRequirements(
              currentPose: "Standing",
              message: "Raise your heels off the floor",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHeel,
                  b: PoseLandmarkType.leftFootIndex,
                  c: null,
                  minAngle: 20,
                  maxAngle: 50,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHeel,
                  b: PoseLandmarkType.rightFootIndex,
                  c: null,
                  minAngle: 20,
                  maxAngle: 50,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
            TransitionRequirements(
              currentPose: "Extended calfs",
              message: "Lower your heels back to the floor",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHeel,
                  b: PoseLandmarkType.leftFootIndex,
                  c: null,
                  minAngle: 0,
                  maxAngle: 15,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHeel,
                  b: PoseLandmarkType.rightFootIndex,
                  c: null,
                  minAngle: 0,
                  maxAngle: 15,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
          ],
        );
      case ExerciseType.heelStretch:
        return ExerciseTracker(
          exerciseLength: 2,
          importantLandmarks: {
            PoseLandmarkType.leftAnkle,
            PoseLandmarkType.rightAnkle,
            PoseLandmarkType.leftKnee,
            PoseLandmarkType.rightKnee,
            PoseLandmarkType.leftHeel,
            PoseLandmarkType.rightHeel,
          },
          transitions: [
            TransitionRequirements(
              currentPose: "Standing",
              message:
                  "Push a knee towards the wall keeping the other leg stretched",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 90,
                  maxAngle: 140,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              alternatePath: [
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 90,
                  maxAngle: 155,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
            TransitionRequirements(
              currentPose: "Strected heel",
              message: "Hold, then return to the intial pose",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
          ],
        );
      case ExerciseType.singleLegStance:
        return ExerciseTracker(
          exerciseLength: 2,
          importantLandmarks: {
            PoseLandmarkType.leftAnkle,
            PoseLandmarkType.rightAnkle,
            PoseLandmarkType.leftKnee,
            PoseLandmarkType.rightKnee,
            PoseLandmarkType.leftHip,
            PoseLandmarkType.rightHip,
          },
          transitions: [
            TransitionRequirements(
              currentPose: "Standing",
              message: "Lift one leg and hold",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 100,
                  maxAngle: 140,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              alternatePath: [
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 100,
                  maxAngle: 140,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
            TransitionRequirements(
              currentPose: "One leg lift",
              message: "Hold your leg then let go",
              successPath: [
                Scenario(
                  a: PoseLandmarkType.leftHip,
                  b: PoseLandmarkType.leftKnee,
                  c: PoseLandmarkType.leftAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
                Scenario(
                  a: PoseLandmarkType.rightHip,
                  b: PoseLandmarkType.rightKnee,
                  c: PoseLandmarkType.rightAnkle,
                  minAngle: 165,
                  maxAngle: 180,
                  errorMessage: "",
                ),
              ],
              failPaths: [],
            ),
          ],
        );
    }
  }

  int currentState = 0;
  final int exerciseLength;
  List<TransitionRequirements> transitions;
  Set<PoseLandmarkType> importantLandmarks;
  String message = "";
  bool errorFlag = false;
  void advanceState(List<Pose> poses, ExerciseFormProvider provider) {
    if (poses.isEmpty) {
      errorFlag = true;
      message = "No human detected in the view";
      provider.updateExerciseForm(!errorFlag, message, "No pose info");
      return;
    }

    Pose pose = poses[0];
    final Set<PoseLandmarkType> detectedTypes = pose.landmarks.keys.toSet();

    if (!detectedTypes.containsAll(importantLandmarks)) {
      errorFlag = true;
      message = "Not all the relevant joints are in view";
      provider.updateExerciseForm(!errorFlag, message, "No pose info");
      return;
    }

    errorFlag = false; // Reset error flag at the beginning
    int evaluation = transitions[currentState].evaluateRequirments(pose);

    switch (evaluation) {
      case 1: // Success
        if (currentState == exerciseLength - 1) {
          provider.increaseRepCount();
        }
        currentState = (currentState + 1) % exerciseLength;
        message =
            transitions[currentState].message; // Update to next state's message
        break;
      case -1: // Fail
        message = transitions[currentState].errorMessage!;
        if (errorFlag) currentState = 0;
        errorFlag = true;
        break;
      default: // Neutral
        message = transitions[currentState].message;
        break;
    }
    provider.updateExerciseForm(
      !errorFlag,
      message,
      transitions[currentState].currentPose,
    );
  }
}
