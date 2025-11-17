import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedBottom = 0; // 0 = Stateless, 1 = Stateful
  int _selectedExercise = 0;

  int get selectedBottom => _selectedBottom;
  int get selectedExercise => _selectedExercise;

  void setBottom(int index) {
    _selectedBottom = index;
    _selectedExercise = 0; // reset cuando cambias de página
    notifyListeners();
  }

  void setExercise(int index) {
    _selectedExercise = index;
    notifyListeners();
  }
}
