import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';

part 'transaction_entity.g.dart';

@JsonSerializable()
class TransactionEntity {
  final String txHash;
  final int blockHeight;
  final String txType;
  final String timeStamp;
  final String fromAddr;
  final String toAddr;
  final String value;
  final String txAsset;
  final String txFee;
  final int code;
  final String memo;
  final int source;
  final int sequence;

  TransactionEntity(
      {required this.txHash,
      required this.txAsset,
      required this.txFee,
      required this.txType,
      required this.fromAddr,
      required this.toAddr,
      required this.timeStamp,
      required this.value,
      required this.code,
      required this.memo,
      required this.sequence,
      required this.source,
      required this.blockHeight});

  factory TransactionEntity.fromJson(Map<String, dynamic>? json) =>
      _$TransactionEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);
}
