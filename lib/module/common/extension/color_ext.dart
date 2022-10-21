

import 'package:flutter/material.dart';

extension ColorExt on Colors {

  static Color hex(int hexValue, {double? alpha}) {
    int a = alpha != null ? (alpha * 255).toInt() : 255;
    int r = (hexValue & 0xFF0000) >> 16;
    int g = (hexValue & 0xFF00) >> 8;
    int b = (hexValue & 0xFF);
    return Color.fromARGB(a, r, g, b);
  }
} 