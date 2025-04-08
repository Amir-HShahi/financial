import 'package:financial/domain/entities/register_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterRequestModel extends RegisterRequest {
  RegisterRequestModel(
    super.email,
    super.password,
    super.firstName,
    super.lastName,
  );

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
