import 'package:json_annotation/json_annotation.dart';

part 'from_utxo.g.dart';

@JsonSerializable()
class FromUTXO {
  final String txHash;
  final int index;
  final String privateKey;

  FromUTXO(
      {required this.txHash, required this.index, required this.privateKey});

  factory FromUTXO.fromJson(Map<String, dynamic>? json) =>
      _$FromUTXOFromJson(json!);

  Map<String, dynamic> toJson() => _$FromUTXOToJson(this);
}
