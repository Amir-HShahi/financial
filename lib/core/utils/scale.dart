import 'package:flutter/material.dart';

abstract class Scale {
  static bool _isScreenDataInitialized = false;

  // according to figma design
  static final double _designHeight = 852;
  static final double _designWidth = 393;

  // screen scale according to design height and width
  static late double _screenHeightScale;
  static late double _screenWidthScale;

  static void initScreenData(BuildContext context) {
    final screenData = MediaQuery.of(context);
    final screenHeight =
        screenData.size.height -
        screenData.padding.top -
        screenData.padding.bottom;
    final screenWidth = screenData.size.width;

    // initialize scale
    _screenHeightScale = screenHeight / _designHeight;
    _screenWidthScale = screenWidth / _designWidth;

    _isScreenDataInitialized = true;
  }

  /// returns the scaled height according to design
  /// * screen data must be initialized before calling
  static double height(double height) {
    _ensureDataInitialized();
    return _screenHeightScale * height;
  }

  /// returns the scaled width according to design
  /// * screen data must be initialized before calling
  static double width(double width) {
    _ensureDataInitialized();
    return _screenWidthScale * width;
  }

  static void _ensureDataInitialized() {
    if (!_isScreenDataInitialized) {
      throw Exception("Screen data must be initialized");
    }
  }
}
