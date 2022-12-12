import 'package:json_annotation/json_annotation.dart';

part 'generate_algorand_address_response.g.dart';

@JsonSerializable()
class GenerateAlgorandAddressResponse {
  final String address;

  GenerateAlgorandAddressResponse({required this.address});

  factory GenerateAlgorandAddressResponse.fromJson(Map<String, dynamic>? json) =>
      _$GenerateAlgorandAddressResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateAlgorandAddressResponseToJson(this);
}
