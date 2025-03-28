// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['budget'] as num).toDouble(),
      (json['available_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'budget': instance.budget,
      'available_amount': instance.availableAmount,
    };
