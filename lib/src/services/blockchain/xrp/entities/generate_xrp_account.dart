import 'package:json_annotation/json_annotation.dart';

part 'generate_xrp_account.g.dart';

@JsonSerializable()
class GenerateXRPWallet {
  final String? address;
  final String? secret;

  GenerateXRPWallet({this.address, this.secret});

  factory GenerateXRPWallet.fromJson(Map<String, dynamic>? json) =>
      _$GenerateXRPWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GenerateXRPWalletToJson(this);
}
