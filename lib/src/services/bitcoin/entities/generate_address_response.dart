
import 'package:json_annotation/json_annotation.dart';

part 'generate_address_response.g.dart';

@JsonSerializable()
class GenerateAddressResponse {
  final String address;

  GenerateAddressResponse({required this.address});

  factory GenerateAddressResponse.fromJson(Map<String, dynamic>? json) =>
      _$GenerateAddressResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateAddressResponseToJson(this);
}
