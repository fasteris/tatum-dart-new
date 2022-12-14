
import 'package:json_annotation/json_annotation.dart';

part 'generate_dogecoin_response.g.dart';

@JsonSerializable()
class GenerateDogecoinWallet {
  final String mnemonic;
  final String xpub;

  GenerateDogecoinWallet({required this.mnemonic, required this.xpub});

  factory GenerateDogecoinWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateDogecoinWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateDogecoinWalletToJson(this);
}



