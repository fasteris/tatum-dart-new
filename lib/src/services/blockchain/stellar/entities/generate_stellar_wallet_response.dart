import 'package:json_annotation/json_annotation.dart';

part 'generate_stellar_wallet_response.g.dart';

@JsonSerializable()
class GenerateStellarWallet {
  final String? address;
  final String? secret;

  GenerateStellarWallet({this.address, this.secret});

  factory GenerateStellarWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateStellarWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateStellarWalletToJson(this);
}
