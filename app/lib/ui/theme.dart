import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      secondary: Colors.tealAccent,
    ),
    cardTheme: const CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}

ThemeData buildHighContrastTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Colors.yellowAccent,
      secondary: Colors.black,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        side: BorderSide(color: Colors.white, width: 2),
      ),
    ),
  );
}
