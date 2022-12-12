
import 'package:json_annotation/json_annotation.dart';

part 'generate_wallet_response.g.dart';

@JsonSerializable()
class GenerateBitcoinWalletResponse {
  final String mnemonic;
  final String xpub;

  GenerateBitcoinWalletResponse({required this.mnemonic, required this.xpub});

  factory GenerateBitcoinWalletResponse.fromJson(Map<String, dynamic>? json) =>
      _$GenerateBitcoinWalletResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateBitcoinWalletResponseToJson(this);
}
