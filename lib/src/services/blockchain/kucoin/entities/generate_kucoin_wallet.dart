import 'package:json_annotation/json_annotation.dart';

part 'generate_kucoin_wallet.g.dart';

@JsonSerializable()
class GenerateKuCoinWallet {
  final String mnemonic;
  final String xpub;

  GenerateKuCoinWallet({required this.mnemonic, required this.xpub});

  factory GenerateKuCoinWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateKuCoinWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateKuCoinWalletToJson(this);
}
