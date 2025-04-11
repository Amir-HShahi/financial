import 'package:financial/data/data_sources/local/hive_database_impl.dart';
import 'package:financial/data/data_sources/local/local_tokens.dart';
import 'package:financial/data/repositories/authorization_impl.dart';
import 'package:financial/data/repositories/category_repository_impl.dart';
import 'package:financial/data/repositories/encryption_impl.dart';
import 'package:financial/data/repositories/local_auth_handler.dart';
import 'package:financial/data/repositories/screenshot_handler.dart';
import 'package:financial/data/repositories/transaction_repository_impl.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjector {
  static final GetIt locator = GetIt.instance;

  static void setUpLocator() {
    locator.registerLazySingleton<AuthorizationImpl>(() => AuthorizationImpl());
    locator.registerLazySingleton<ScreenshotHandler>(() => ScreenshotHandler());
    locator.registerLazySingleton<LocalAuthHandler>(() => LocalAuthHandler());
  }

  static void authorizedSetup() {
    locator.registerLazySingleton<HiveDatabaseImpl>(() => HiveDatabaseImpl());
    locator.registerLazySingleton<LocalTokens>(() => LocalTokens());
    locator.registerLazySingleton<EncryptionImpl>(() => EncryptionImpl());
    locator.registerLazySingleton<CategoryRepositoryImpl>(
      () => CategoryRepositoryImpl(),
    );
    locator.registerLazySingleton<TransactionRepositoryImpl>(
      () => TransactionRepositoryImpl(),
    );

  }
}
