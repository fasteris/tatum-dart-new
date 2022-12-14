
import 'package:json_annotation/json_annotation.dart';

part 'generate_ethereum_wallet_response.g.dart';

@JsonSerializable()
class GenerateEthereumWallet {
  final String mnemonic;
  final String xpub;

  GenerateEthereumWallet({required this.mnemonic, required this.xpub});

  factory GenerateEthereumWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateEthereumWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateEthereumWalletToJson(this);
}

