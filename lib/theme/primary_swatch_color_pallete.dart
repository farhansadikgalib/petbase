import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor kToLight = const MaterialColor(
    0xff333333, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff474747 ),//10%
      100: const Color(0xff5c5c5c),//20%
      200: const Color(0xff707070),//30%
      300: const Color(0xff858585),//40%
      400: const Color(0xff999999),//50%
      500: const Color(0xffadadad),//60%
      600: const Color(0xffc2c2c2),//70%
      700: const Color(0xffd6d6d6),//80%
      800: const Color(0xffebebeb),//90%
      900: const Color(0xffffffff),//100%
    },
  );

  static const MaterialColor kToDark = const MaterialColor(
    0xff333333, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff2e2e2e ),//10%
      100: const Color(0xff292929),//20%
      200: const Color(0xff242424),//30%
      300: const Color(0xff1f1f1f),//40%
      400: const Color(0xff1a1a1a),//50%
      500: const Color(0xff141414),//60%
      600: const Color(0xff0f0f0f),//70%
      700: const Color(0xff0a0a0a),//80%
      800: const Color(0xff050505),//90%
      900: const Color(0xff000000),//100%
    },
  );
}