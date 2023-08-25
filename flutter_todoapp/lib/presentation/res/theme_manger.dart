import 'package:flutter/material.dart';

class ThemeManger with ChangeNotifier{
  ThemeMode _themeMode=ThemeMode.light;
  get themeMode=>_themeMode;
  toogleTheme(bool isdark){
    _themeMode=isdark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}