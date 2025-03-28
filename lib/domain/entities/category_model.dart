import 'dart:ui';

import 'package:financial/domain/entities/transaction_model.dart';

class CategoryModel {
  final String title;
  final Color color;
  final String iconPath;
  List<TransactionModel> transactions = [];

  CategoryModel({
    required this.title,
    required this.color,
    required this.iconPath,
  });
}
