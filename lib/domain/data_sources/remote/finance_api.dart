import 'dart:async';

import '../../../data/models/category_model.dart';
import '../../../data/models/transaction_model.dart';

abstract class FinanceApi {
  final String financePath = '/finance/';

  Future<List<TransactionModel>> getAllTransactions();

  Future<void> postTransaction(TransactionModel transaction);

  Future<TransactionModel> getTransaction(int id);

  Future<void> deleteTransaction(int id);

  Future<void> increaseBudget(CategoryModel category);

  Future<void> decreaseBudget(CategoryModel category);

  Future<List<CategoryModel>> getAllCategories();

  Future<CategoryModel> getCategory(int id);
}
