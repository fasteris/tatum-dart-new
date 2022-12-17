import 'package:json_annotation/json_annotation.dart';

part 'generate_polygon_wallet.g.dart';

@JsonSerializable()
class GeneratePolygonWallet {
  final String mnemonic;
  final String xpub;

  GeneratePolygonWallet({required this.mnemonic, required this.xpub});

  factory GeneratePolygonWallet.fromJson(Map<String, dynamic>? json) =>
      _$GeneratePolygonWalletFromJson(json!);

  Map<String, dynamic> toJson() => _$GeneratePolygonWalletToJson(this);
}
