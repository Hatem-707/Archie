import 'package:flutter/material.dart';

class ExerciseFormProvider extends ChangeNotifier {
  bool _correctForm = true;
  bool get correctForm => _correctForm;
  String _message = "";
  String get message => _message;
  String _currentPose = "";
  String get currentPose => _currentPose;
  int _repCount = 0;
  int get repCount => _repCount;
  void updateExerciseForm(bool value, String message, currentPose) {
    _correctForm = value;
    _message = message;
    _currentPose = currentPose;
    notifyListeners();
  }

  void increaseRepCount() {
    ++_repCount;
    notifyListeners();
  }
}
