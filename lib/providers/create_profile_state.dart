import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';

class CreateProfileState extends ChangeNotifier {

  FlexScheme selectedTheme = FlexScheme.material;
  double fontSizeMultiplier = 1;

  changeTheme(FlexScheme theme) {
    selectedTheme = theme;
    notifyListeners();
  }

  changeFontSizeMultiplier(double rangeValue) {
    fontSizeMultiplier = rangeValue;
    notifyListeners();
  }

  resetToInitialState() {
    selectedTheme = FlexScheme.material;
    fontSizeMultiplier = 1;
  }

}