import 'package:financial/domain/repositories/prevent_screenshot.dart';
import 'package:no_screenshot/no_screenshot.dart';

class ScreenshotHandler extends PreventScreenshot {
  @override
  NoScreenshot noScreenshot = NoScreenshot.instance;

  @override
  Future<void> disableScreenshot() async {
    await noScreenshot.screenshotOff();
  }

  @override
  Future<void> enableScreenshot() async {
    await noScreenshot.screenshotOn();
  }
}
