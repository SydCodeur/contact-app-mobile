import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff4267b2, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff3b5da0), //10%
      100: const Color(0xff35528e), //20%
      200: const Color(0xff2e487d), //30%
      300: const Color(0xff2e487d), //40%
      400: const Color(0xff283e6b), //50%
      500: const Color(0xff1a2947), //60%
      600: const Color(0xff141f35), //70%
      700: const Color(0xff0d1524), //80%
      800: const Color(0xff070a12), //90%
      900: const Color(0xff000000), //100%
    },
  );
} // you can
