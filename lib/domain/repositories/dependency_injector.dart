import 'package:financial/data/data_sources/local/hive_database_impl.dart';
import 'package:financial/data/data_sources/local/local_tokens.dart';
import 'package:financial/data/repositories/encryption_impl.dart';
import 'package:financial/data/repositories/screenshot_handler.dart';
import 'package:financial/domain/repositories/prevent_screenshot.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjector {
  static final GetIt locator = GetIt.instance;

  static void setUpLocator() {
    locator.registerLazySingleton<HiveDatabaseImpl>(() => HiveDatabaseImpl());
    locator.registerLazySingleton<EncryptionImpl>(() => EncryptionImpl());
    locator.registerLazySingleton<LocalTokens>(() => LocalTokens());
    locator.registerLazySingleton<PreventScreenshot>(() => ScreenshotHandler());
  }
}
