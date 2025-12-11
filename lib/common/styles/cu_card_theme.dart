import 'package:flutter/material.dart';

class CUCardTheme {
  static const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );

  static CardThemeData lightCardTheme = CardThemeData(
    color: Colors.white,
    elevation: 4.0,
    shape: cardShape,
    shadowColor: Color(0x4186B1FF),
  );

  static CardThemeData darkCardTheme = CardThemeData(
    color: Color(0xFF000B20),
    elevation: 5.0,
    shape: cardShape,
    shadowColor: Color(0x17D8DFF6),
  );
}
