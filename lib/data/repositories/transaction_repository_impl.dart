import 'package:financial/data/data_sources/local/hive_database_impl.dart';
import 'package:financial/data/models/transaction_model.dart';
import 'package:financial/domain/repositories/dependency_injector.dart';
import 'package:financial/domain/repositories/transaction_repository.dart';
import 'package:hive/hive.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  late final Box<Map<String, dynamic>> box;

  TransactionRepositoryImpl() {
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
      TransactionModel model = TransactionModel.fromJson(box.getAt(i)!);
      models.add(model);
    }
    return models;
  }

  @override
  List<TransactionModel> getCategoryTransactions({required int categoryId}) {
    List<TransactionModel> models = [];
    for (int i = 0; i < box.length; i++) {
      TransactionModel model = TransactionModel.fromJson(box.getAt(i)!);
      if (categoryId == model.categoryId) {
        models.add(model);
      }
    }
    return models;
  }
}
