import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedBottomIndex = 0;
  int _selectedExercise = 0;

  int get selectedBottom => _selectedBottomIndex;
  int get selectedExercise => _selectedExercise;

  void setBottom(int value) {
    _selectedBottomIndex = value;
    notifyListeners();
  }

  void setExercise(int? value) {
    if (value != null) {
      _selectedExercise = value;
      notifyListeners();
    }
  }
} 