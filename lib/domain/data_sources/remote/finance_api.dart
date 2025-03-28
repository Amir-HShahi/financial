import 'dart:async';

import 'package:financial/domain/entities/category.dart';
import 'package:financial/domain/entities/transaction.dart';

abstract class FinanceApi {
  Future<List<Transaction>> getAllTransactions();

  Future<void> postTransaction(Transaction transaction);

  Future<Transaction> getTransaction(int id);

  Future<void> deleteTransaction(int id);

  Future<void> updateTransaction(Transaction transaction);

  Future<void> increaseBudget(Category category);

  Future<void> decreaseBudget(Category category);

  Future<List<Category>> getAllCategories();

  Future<Category> getCategory(int id);
}
