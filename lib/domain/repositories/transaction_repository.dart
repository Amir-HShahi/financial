import 'package:financial/data/models/transaction_model.dart';

abstract class TransactionRepository {
  List<TransactionModel> getAll();

  void add({required TransactionModel transaction});

  void delete({required int id});

  void getCategoryTransaction({required int categoryId});
}
