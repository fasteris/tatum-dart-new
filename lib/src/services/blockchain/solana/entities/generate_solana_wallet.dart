import 'package:json_annotation/json_annotation.dart';

part 'generate_solana_wallet.g.dart';

@JsonSerializable()
class GenerateSolanaWallet {
  final String mnemonic;
  final String xpub;
  final String? privateKey;

  GenerateSolanaWallet({required this.mnemonic, required this.xpub, this.privateKey});

  factory GenerateSolanaWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateSolanaWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateSolanaWalletToJson(this);
}
