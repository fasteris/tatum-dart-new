import 'package:json_annotation/json_annotation.dart';

part 'generate_vechain_wallet.g.dart';

@JsonSerializable()
class GenerateVeChainWallet {
  final String mnemonic;
  final String xpub;

  GenerateVeChainWallet({required this.mnemonic, required this.xpub});

  factory GenerateVeChainWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateVeChainWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateVeChainWalletToJson(this);
}
