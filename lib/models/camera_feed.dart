import 'dart:io';
import 'package:camera/camera.dart';
import 'package:feetly/controllers/exercise_form_provider.dart';
import 'package:feetly/models/exercise_tracker.dart';
import 'package:feetly/models/painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class CameraFeed extends StatefulWidget {
  const CameraFeed({super.key, required this.exerciseTitle});

  final String exerciseTitle;
  final CameraLensDirection initialCameraLensDirection =
      CameraLensDirection.back;

  @override
  State<CameraFeed> createState() => _CameraFeedState();
}

class _CameraFeedState extends State<CameraFeed> {
  late CameraController? _controller;

  final PoseDetector _poseDetector = PoseDetector(
    options: PoseDetectorOptions(),
  );

  bool _canProcess = true;
  bool _isBusy = false;
  bool _feedReady = false;
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;
  int _cameraIndex = 0;
  static List<CameraDescription> _cameras = [];

  final ExerciseFormProvider _exerciseFormProvider = ExerciseFormProvider();
  late ExerciseTracker exerciseTracker;

  @override
  void initState() {
    super.initState();
    _initialize();
    _initTracker();
  }

  void _initTracker() {
    final String exerciseTitle = widget.exerciseTitle;
    switch (exerciseTitle) {
      case "Calf raises":
        exerciseTracker = ExerciseTracker.fromType(ExerciseType.calfRaise);
        return;
      case "Heel Stretches":
        exerciseTracker = ExerciseTracker.fromType(ExerciseType.heelStretch);
        return;
      case "Single Leg Stance":
        exerciseTracker = ExerciseTracker.fromType(
          ExerciseType.singleLegStance,
        );
        return;
      case "Body Weight Squats":
        exerciseTracker = ExerciseTracker.fromType(ExerciseType.squat);
        return;
      case "Single Leg Glute Bridge":
        exerciseTracker = ExerciseTracker.fromType(ExerciseType.gluteBridge);
        return;
      default:
        exerciseTracker = ExerciseTracker.fromType(ExerciseType.calfRaise);
        return;
    }
  }

  void _initialize() async {
    if (_cameras.isEmpty) {
      _cameras = await availableCameras();
    }
    if (_cameras.isNotEmpty) {
      _startLiveFeed();
    }
  }

  Future<void> _startLiveFeed() async {
    final CameraDescription camera = _cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    await _controller!.initialize();
    _controller!.startImageStream(_processCameraImage).then((value) {});
    setState(() {
      _feedReady = true;
      _canProcess = true;
    });
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future<void> _toggleCamera() async {
    setState(() {
      _cameraLensDirection = (_cameraLensDirection == CameraLensDirection.back)
          ? CameraLensDirection.front
          : CameraLensDirection.back;
      _cameraIndex = (_cameraIndex == 0) ? 1 : 0;
      _feedReady = false;
      _canProcess = false;
    });
    await _stopLiveFeed();
    await _startLiveFeed();
  }

  @override
  void dispose() async {
    _canProcess = false;
    _poseDetector.close();
    _stopLiveFeed();
    super.dispose();
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {});
    final poses = await _poseDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = PosePainter(
        poses,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      exerciseTracker.advanceState(poses, _exerciseFormProvider);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_controller == null) return null;
    final camera = _cameras[_cameraIndex];
    final sensorOrientation = camera.sensorOrientation;

    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[_controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  void _processCameraImage(CameraImage image) {
    final InputImage? inputImage = _inputImageFromCameraImage(image);
    if (inputImage != null) {
      _processImage(inputImage);
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: theme.colorScheme.primary),
        ),
        title: Text(
          widget.exerciseTitle,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _toggleCamera();
            },
            icon: Icon(Icons.cameraswitch, color: theme.colorScheme.primary),
          ),
        ],
      ),
      body: Center(
        child: (_feedReady)
            ? ListenableBuilder(
                listenable: _exerciseFormProvider,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: (_exerciseFormProvider.correctForm)
                              ? theme.colorScheme.primaryContainer
                              : theme.colorScheme.errorContainer,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          clipBehavior: Clip.hardEdge,
                          child: CameraPreview(
                            _controller!,
                            child: _customPaint,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: (_exerciseFormProvider.correctForm)
                              ? theme.colorScheme.primaryContainer
                              : theme.colorScheme.errorContainer,
                        ),
                        child: Center(
                          child: Text(
                            "Current pose: ${_exerciseFormProvider.currentPose}",
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: (_exerciseFormProvider.correctForm)
                                  ? theme.colorScheme.onPrimaryContainer
                                  : theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: (_exerciseFormProvider.correctForm)
                              ? theme.colorScheme.primaryContainer
                              : theme.colorScheme.errorContainer,
                        ),
                        child: Center(
                          child: Text(
                            "Rep Count: ${_exerciseFormProvider.repCount}",
                            style: theme.textTheme.titleLarge!.copyWith(
                              color: (_exerciseFormProvider.correctForm)
                                  ? theme.colorScheme.onPrimaryContainer
                                  : theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: (_exerciseFormProvider.correctForm)
                              ? theme.colorScheme.primaryContainer
                              : theme.colorScheme.errorContainer,
                        ),
                        child: Center(
                          child: Text(
                            _exerciseFormProvider.message,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: (_exerciseFormProvider.correctForm)
                                  ? theme.colorScheme.onPrimaryContainer
                                  : theme.colorScheme.onErrorContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
