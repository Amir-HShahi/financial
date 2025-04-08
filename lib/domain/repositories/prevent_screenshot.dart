import 'package:no_screenshot/no_screenshot.dart';

abstract class PreventScreenshot {
  abstract NoScreenshot noScreenshot;

  Future<void> enableScreenshot();

  Future<void> disableScreenshot();
}
