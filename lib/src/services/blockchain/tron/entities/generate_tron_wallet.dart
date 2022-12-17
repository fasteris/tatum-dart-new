import 'package:json_annotation/json_annotation.dart';

part 'generate_tron_wallet.g.dart';

@JsonSerializable()
class GenerateTronWallet {
  final String? mnemonic;
  final String? xpub;

  GenerateTronWallet({this.mnemonic, this.xpub});

  factory GenerateTronWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateTronWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateTronWalletToJson(this);
}
