import 'package:json_annotation/json_annotation.dart';

part 'generate_xinfin_wallet.g.dart';

@JsonSerializable()
class GenerateXinfinWallet {
  final String mnemonic;
  final String xpub;

  GenerateXinfinWallet({required this.mnemonic, required this.xpub});

  factory GenerateXinfinWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateXinfinWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateXinfinWalletToJson(this);
}
