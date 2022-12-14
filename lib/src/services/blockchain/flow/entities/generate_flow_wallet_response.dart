import 'package:json_annotation/json_annotation.dart';

part 'generate_flow_wallet_response.g.dart';

@JsonSerializable()
class GenerateFlowWallet {
  final String mnemonic;
  final String xpub;

  GenerateFlowWallet({required this.mnemonic, required this.xpub});

  factory GenerateFlowWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateFlowWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateFlowWalletToJson(this);
}
