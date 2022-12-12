import 'package:json_annotation/json_annotation.dart';

part 'generate_algorand_wallet_response.g.dart';

@JsonSerializable()
class GenerateAlgorandWalletResponse {
  final String address;
  final String secret;

  GenerateAlgorandWalletResponse({required this.address, required this.secret});

  factory GenerateAlgorandWalletResponse.fromJson(Map<String, dynamic>? json) =>
      _$GenerateAlgorandWalletResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateAlgorandWalletResponseToJson(this);
}
