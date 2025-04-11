import 'package:financial/data/models/transaction_model.dart';

abstract class TransactionRepository {
  List<TransactionModel> getAll();

  void add({required TransactionModel transaction});

  void delete({required int id});

  List<TransactionModel> getCategoryTransactions({required int categoryId});

  void loadBox();
}
