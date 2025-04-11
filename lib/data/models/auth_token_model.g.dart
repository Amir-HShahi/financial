// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenModel _$AuthTokenModelFromJson(Map<String, dynamic> json) =>
    AuthTokenModel(
      json['secure_r_s_a_key'] as String,
      json['secure_r_s_a_iv'] as String,
      json['hive_key'] as String,
    );

Map<String, dynamic> _$AuthTokenModelToJson(AuthTokenModel instance) =>
    <String, dynamic>{
      'secure_r_s_a_key': instance.secureRSAKey,
      'secure_r_s_a_iv': instance.secureRSAIv,
      'hive_key': instance.hiveKey,
    };
