import 'package:flutter/material.dart';

class UIColors {
  UIColors._();
  static final Color background = HexColor.fromHex("#ffffff");
  // static final Color circleBg1 = HexColor.fromHex("#ECF2FF");
  // static final Color circleBg2 = HexColor.fromHex("#E3DFFD");
  // static final Color circleBg3 = HexColor.fromHex("#E5D1FA");
  // static final Color circleBg4 = HexColor.fromHex("#FFF4D2");
  // static final Color circleBg5 = HexColor.fromHex("#AD7BE9");
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
