import 'package:flutter/material.dart';
import 'package:mygardenapp/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class GlobalUtils {
  // define context and set constructor
  BuildContext context;
  GlobalUtils(this.context);
  // define get method for use darktheme
  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  // set color of theme
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get screenSize => MediaQuery.of(context).size;
}
