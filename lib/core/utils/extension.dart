import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }
}
