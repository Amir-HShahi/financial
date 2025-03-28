import 'category_model.dart';

enum TransactionType { income, expense }

class TransactionModel {
  final int id = 1; // todo
  final int amount;
  final String title;
  final CategoryModel category;
  final DateTime date;
  final TransactionType transactionType;

  const TransactionModel({
    required this.amount,
    required this.title,
    required this.category,
    required this.date,
    required this.transactionType,
  });
}
