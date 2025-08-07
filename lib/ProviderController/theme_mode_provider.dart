import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChangeProvider with ChangeNotifier{
  ThemeMode currentTheme=ThemeMode.light;

  clickManageTheme(){
    if(currentTheme==ThemeMode.dark){
      currentTheme=ThemeMode.light;
    }
    else {
      currentTheme=ThemeMode.dark;
    }
    notifyListeners();
  }
}