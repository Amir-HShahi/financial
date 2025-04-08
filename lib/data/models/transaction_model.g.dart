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
      CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      DateTime.parse(json['date'] as String),
      (json['amount'] as num).toInt(),
      (json['user'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'transaction_type': _$TransactionTypeEnumMap[instance.transactionType]!,
      'category': instance.category,
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'user': instance.user,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
