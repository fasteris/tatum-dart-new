import 'package:json_annotation/json_annotation.dart';

part 'generate_celo_wallet_response.g.dart';

@JsonSerializable()
class GenerateCeloWallet {
  final String mnemonic;
  final String xpub;

  GenerateCeloWallet({required this.mnemonic, required this.xpub});

  factory GenerateCeloWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateCeloWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateCeloWalletToJson(this);
}
