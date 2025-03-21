import 'dart:ui';

import 'package:financial/model/transaction_model.dart';

class BudgetModel {
  final int id = 1; // todo
  final String title;
  final Color color;
  double amount = 0;
  List<TransactionModel> transactions = [];

  BudgetModel({required this.title, required this.color});
}
