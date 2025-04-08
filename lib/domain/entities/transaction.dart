import '../../data/models/category_model.dart';

enum TransactionType { income, expense }

abstract class Transaction {
  int id;
  String title;
  TransactionType transactionType;
  CategoryModel category;
  DateTime date;
  int amount;
  int user;

  Transaction(
    this.id,
    this.title,
    this.transactionType,
    this.category,
    this.date,
    this.amount,
    this.user,
  );
}
