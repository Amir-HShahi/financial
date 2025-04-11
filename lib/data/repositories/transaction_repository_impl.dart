import 'package:financial/data/data_sources/local/hive_database_impl.dart';
import 'package:financial/data/models/transaction_model.dart';
import 'package:financial/domain/repositories/dependency_injector.dart';
import 'package:financial/domain/repositories/transaction_repository.dart';
import 'package:hive/hive.dart';

import 'encryption_impl.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  late final Box<Map<String, dynamic>> box;
  late final EncryptionImpl en;

  TransactionRepositoryImpl() {
    en = DependencyInjector.locator<EncryptionImpl>();
    loadBox();
  }

  @override
  void loadBox() async {
    var db = DependencyInjector.locator<HiveDatabaseImpl>();
    box = await db.getTransactionsBox();
  }

  @override
  void add({required TransactionModel transaction}) {
    var json = transaction.toJson();
    json = en.encryptJson(json: json);
    box.put(transaction.id, json);
  }

  @override
  void delete({required int id}) {
    box.delete(id);
  }

  @override
  List<TransactionModel> getAll() {
    List<TransactionModel> models = [];
    for (int i = 0; i < box.length; i++) {
      var json = box.getAt(i)!;
      json = en.decryptJson(json: json);
      TransactionModel model = TransactionModel.fromJson(json);
      models.add(model);
    }
    return models;
  }

  @override
  List<TransactionModel> getCategoryTransactions({required int categoryId}) {
    List<TransactionModel> models = [];
    for (int i = 0; i < box.length; i++) {
      var json = box.getAt(i)!;
      json = en.decryptJson(json: json);
      TransactionModel model = TransactionModel.fromJson(json);
      if (categoryId == model.categoryId) {
        models.add(model);
      }
    }
    return models;
  }
}
