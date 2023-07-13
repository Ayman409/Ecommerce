import 'package:flutter/material.dart';

import 'colors.dart';


final lightTheme = ThemeData(
  fontFamily: 'Cairo',
  appBarTheme:  AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.blue.shade800,
    //foregroundColor: kSecondaryColor,
    elevation: 0
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor,
    primary: Colors.grey,
  ),
);
