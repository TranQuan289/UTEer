import 'package:flutter/material.dart';

class UIColors {
  UIColors._();
  static final Color background = HexColor.fromHex("#E6ecef");
  static final Color eye = HexColor.fromHex("#3083f2");
  static final Color border = HexColor.fromHex("#9caccc");
  static final Color white = HexColor.fromHex("#ffffff");
  static final Color black = HexColor.fromHex("#000000");
  static final Color title = HexColor.fromHex("#3c679b");
  static final Color button = HexColor.fromHex("#0a4181");
  static final Color blue = HexColor.fromHex("#5b98f2");
}

extension HexColor on Color {
  /// String is in the format "Color" or "ffColor" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    Color color = Colors.black;
    try {
      color = Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {}
    return color;
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
