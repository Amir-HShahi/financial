import 'package:financial/data/data_sources/local/hive_database_impl.dart';
import 'package:financial/data/repositories/encryption_impl.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjector {
  static final GetIt locator = GetIt.instance;

  static void setUpLocator() {
    locator.registerLazySingleton<HiveDatabaseImpl>(() => HiveDatabaseImpl());
    locator.registerLazySingleton<EncryptionImpl>(() => EncryptionImpl());
  }
}
