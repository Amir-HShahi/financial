import 'package:financial/domain/data_sources/local/hive_database.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabaseImpl implements HiveDatabase {
  @override
  Future<Box<Map<String, dynamic>>> getCategoriesBox() async {
    // todo
    final encryptionCipher = HiveAesCipher(Hive.generateSecureKey());

    final box = await Hive.openBox<Map<String, dynamic>>(
      'categories',
      encryptionCipher: encryptionCipher,
    );
    return box;
  }

  @override
  Future<Box<Map<String, dynamic>>> getTransactionsBox() async {
    // todo
    final encryptionCipher = HiveAesCipher(Hive.generateSecureKey());

    final box = await Hive.openBox<Map<String, dynamic>>(
      'transactions',
      encryptionCipher: encryptionCipher,
    );
    return box;
  }

  @override
  void initialize() async {
    Hive.initFlutter();
  }

  @override
  void deleteAllFromDisk() {
    Hive.deleteFromDisk();
  }
}
