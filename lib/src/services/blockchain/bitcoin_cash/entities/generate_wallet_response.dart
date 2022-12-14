import 'package:json_annotation/json_annotation.dart';

part 'generate_wallet_response.g.dart';

@JsonSerializable()
class GenerateBCashWalletResponse {
  final String mnemonic;
  final String xpub;

  GenerateBCashWalletResponse({required this.mnemonic, required this.xpub});

  factory GenerateBCashWalletResponse.fromJson(Map<String, dynamic>? json) =>
      _$GenerateBCashWalletResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateBCashWalletResponseToJson(this);
}
