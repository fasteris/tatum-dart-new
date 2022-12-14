import 'package:json_annotation/json_annotation.dart';

part 'generate_wallet_response.g.dart';

@JsonSerializable()
class GenerateBBCWallet {
  final String mnemonic;
  final String xpub;

  GenerateBBCWallet({required this.mnemonic, required this.xpub});

  factory GenerateBBCWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateBBCWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateBBCWalletToJson(this);
}
