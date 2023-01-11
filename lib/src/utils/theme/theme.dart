import 'package:flutter/material.dart';
import 'package:pillowjournal/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:pillowjournal/src/utils/theme/widget_themes/text_theme.dart';

class AppTheme{

  AppTheme._(); //make the constructor private

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    textTheme: Text_Theme.lightTextTheme,
    elevatedButtonTheme: ElevatedButton_Theme.lightElevatedButtonTheme,
    appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 237, 237, 237)),
  );  

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: const Color.fromARGB(255, 28, 47, 61),
    textTheme: Text_Theme.darkTextTheme,
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButton_Theme.darkElevatedButtonTheme,
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 24, 37, 51)),
  );
}