import 'package:json_annotation/json_annotation.dart';

part 'generate_klay_wallet.g.dart';

@JsonSerializable()
class GenerateKlayWallet {
  final String mnemonic;
  final String xpub;

  GenerateKlayWallet({required this.mnemonic, required this.xpub});

  factory GenerateKlayWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateKlayWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateKlayWalletToJson(this);
}
