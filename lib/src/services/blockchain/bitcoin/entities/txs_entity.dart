import 'package:json_annotation/json_annotation.dart';

part 'txs_entity.g.dart';

@JsonSerializable()
class TXSEntity {
  final String hash;
  final String hex;
  final String witnessHash;
  final int fee;
  final int rate;
  final int mtime;
  final int blockNumber;
  final String block;
  final int time;
  final int index;
  final int version;
  final dynamic inputs;
  final dynamic outputs;
  final int locktime;

  TXSEntity(
      {required this.hash,
      required this.block,
      required this.blockNumber,
      required this.fee,
      required this.hex,
      required this.index,
      required this.inputs,
      required this.locktime,
      required this.mtime,
      required this.outputs,
      required this.rate,
      required this.time,
      required this.version,
      required this.witnessHash});

  factory TXSEntity.fromJson(Map<String, dynamic>? json) =>
      _$TXSEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$TXSEntityToJson(this);
}
