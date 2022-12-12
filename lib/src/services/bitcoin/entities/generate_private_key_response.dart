
import 'package:json_annotation/json_annotation.dart';

part 'generate_private_key_response.g.dart';

@JsonSerializable()
class GeneratePrivateKeysResponse {
  final String key;

  GeneratePrivateKeysResponse({required this.key});

  factory GeneratePrivateKeysResponse.fromJson(Map<String, dynamic>? json) =>
      _$GeneratePrivateKeysResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GeneratePrivateKeysResponseToJson(this);
}
