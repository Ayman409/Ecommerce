import 'package:flutter/material.dart';

abstract class ScreenSizeUtils {
  static final _size = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  ).size;
  static final width = _size.width;
  static final height = _size.height;
}
