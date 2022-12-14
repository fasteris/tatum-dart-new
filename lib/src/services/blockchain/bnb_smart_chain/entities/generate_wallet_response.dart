
import 'package:json_annotation/json_annotation.dart';

part 'generate_wallet_response.g.dart';

@JsonSerializable()
class GenerateBSCWallet {
  final String mnemonic;
  final String xpub;

  GenerateBSCWallet({required this.mnemonic, required this.xpub});

  factory GenerateBSCWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateBSCWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateBSCWalletToJson(this);
}

