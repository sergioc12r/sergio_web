import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';

class CUAppBarTheme{
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white.withAlpha(178),
    elevation: 1,
    centerTitle: false,
    titleTextStyle: CUTextStyles.lightTheme.titleMedium,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 4,
    centerTitle: false,
    titleTextStyle: CUTextStyles.darkTheme.titleMedium,
  );
}