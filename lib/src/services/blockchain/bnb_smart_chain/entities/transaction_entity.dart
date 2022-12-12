import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';

part 'transaction_entity.g.dart';

@JsonSerializable()
class TransactionEntity {
  final String blockHash;
  final bool status;
  final int blockNumber;
  final String from;
  final int gas;
  final String gasPrice;
  final String transactionHash;
  final String input;
  final int nonce;
  final String to;
  final int trasactionIndex;
  final String value;
  final int gasUsed;
  final int cumulativeGasUsed;
  final String contractAddress;
  final List<LogsEntity> logs;
  

  TransactionEntity(
      {required this.blockHash,
      required this.blockNumber,
      required this.contractAddress,
      required this.cumulativeGasUsed,
      required this.from,
      required this.gas,
      required this.gasPrice,
      required this.gasUsed,
      required this.input,
      required this.logs,
      required this.nonce,
      required this.status,
      required this.to,
      required this.transactionHash, 
      required this.trasactionIndex,
      required this.value});

  factory TransactionEntity.fromJson(Map<String, dynamic>? json) =>
      _$TransactionEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);
}
