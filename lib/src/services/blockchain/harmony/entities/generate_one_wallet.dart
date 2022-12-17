import 'package:json_annotation/json_annotation.dart';

part 'generate_one_wallet.g.dart';

@JsonSerializable()
class GenerateONEWallet {
  final String mnemonic;
  final String xpub;

  GenerateONEWallet({required this.mnemonic, required this.xpub});

  factory GenerateONEWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateONEWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateONEWalletToJson(this);
}
