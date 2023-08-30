import 'package:flutter/material.dart';

const Color _customColor = Color.fromRGBO(234, 182, 79, 1);

const List<Color> _colorThemes = [
  _customColor,
  Colors.yellowAccent,
  Colors.blueGrey,
  Colors.redAccent,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.greenAccent,
  Colors.indigoAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    required this.selectedColor,
  }) : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors moust be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
    // brightness: Brightness.dark);
  }
}
