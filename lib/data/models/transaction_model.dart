import 'package:financial/domain/entities/transaction.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionModel extends Transaction {
  TransactionModel(
    super.id,
    super.title,
    super.transactionType,
    super.categoryId,
    super.date,
    super.amount,
  );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
