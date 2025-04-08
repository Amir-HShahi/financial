import 'package:financial/domain/entities/auth_token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_token_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthTokenModel extends AuthToken {
  AuthTokenModel(super.accessToken, super.refreshToken);

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}
