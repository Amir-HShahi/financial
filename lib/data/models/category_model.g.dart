// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      (json['id'] as num).toInt(),
      $enumDecode(_$CategoriesEnumMap, json['title']),
      (json['budget'] as num).toDouble(),
      (json['available_amount'] as num).toDouble(),
      (json['transactions_id'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': _$CategoriesEnumMap[instance.title]!,
      'transactions_id': instance.transactionsId,
      'budget': instance.budget,
      'available_amount': instance.availableAmount,
    };

const _$CategoriesEnumMap = {
  Categories.health: 'health',
  Categories.entertainment: 'entertainment',
  Categories.food: 'food',
  Categories.clothing: 'clothing',
  Categories.transport: 'transport',
  Categories.housing: 'housing',
  Categories.gifts: 'gifts',
  Categories.education: 'education',
  Categories.miscellaneous: 'miscellaneous',
  Categories.savings: 'savings',
};
