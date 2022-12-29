import 'package:json_annotation/json_annotation.dart';

part 'register_token_response.g.dart';

@JsonSerializable()
class RegisterTokenResponse {
  final String? accountId;
  final String? address;

  RegisterTokenResponse({this.accountId, this.address});

  factory RegisterTokenResponse.fromJson(Map<String, dynamic>? json) =>
      _$RegisterTokenResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$RegisterTokenResponseToJson(this);
}
