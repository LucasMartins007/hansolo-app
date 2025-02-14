import 'package:flutter/material.dart';

class CustomThemeData {
  ThemeData getCustomThemeData() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            visualDensity: VisualDensity.comfortable,
            backgroundColor: WidgetStateProperty.all(Colors.deepPurpleAccent),
          ),
        ),
        useMaterial3: true,
      );
}
