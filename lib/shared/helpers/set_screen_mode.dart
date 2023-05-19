import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetScreenMode {
  SetScreenMode._();
  static void fullScreen() {
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.immersiveSticky,
    //   overlays: [],
    // );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
    ));
  }

  static void showOnlyBottomNavigationBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
  }

  static void showOnlyTopStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  static void showAllBars() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: SystemUiOverlay.values,
    );
  }
}
