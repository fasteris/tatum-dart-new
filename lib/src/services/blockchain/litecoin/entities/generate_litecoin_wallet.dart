import 'package:json_annotation/json_annotation.dart';

part 'generate_litecoin_wallet.g.dart';

@JsonSerializable()
class GenerateLitecoinWallet {
  final String mnemonic;
  final String xpub;

  GenerateLitecoinWallet({required this.mnemonic, required this.xpub});

  factory GenerateLitecoinWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateLitecoinWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateLitecoinWalletToJson(this);
}
