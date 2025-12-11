import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_card_theme.dart';

class CUChipTheme{

  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: CUCardTheme.lightCardTheme.color,
    selectedColor: Colors.blue,
    disabledColor: Colors.grey,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: CUCardTheme.darkCardTheme.shadowColor?.withAlpha(80),
    selectedColor: Colors.blue,
    disabledColor: Colors.grey,
  );
}