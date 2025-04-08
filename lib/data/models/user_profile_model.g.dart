// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      json['email'] as String,
      json['full_name'] as String,
      json['profile_picture'] as String,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fullName,
      'profile_picture': instance.profilePicture,
    };
