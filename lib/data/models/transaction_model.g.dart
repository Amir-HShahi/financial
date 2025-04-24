// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      (json['id'] as num).toInt(),
      json['title'] as String,
      $enumDecode(_$TransactionTypeEnumMap, json['transaction_type']),
      (json['category_id'] as num).toInt(),
      DateTime.parse(json['date'] as String),
      (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'transaction_type': _$TransactionTypeEnumMap[instance.transactionType]!,
      'category_id': instance.categoryId,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
