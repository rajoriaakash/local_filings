import 'package:flutter/material.dart';

//provider for values associated with onboarding screen
class OnBoardingProvider extends ChangeNotifier{
  int _selectedIndex = 0;
  //returns current selected page index
  int get selectedIndex => _selectedIndex;

  //used to set page index and navigate
  void setSelectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}