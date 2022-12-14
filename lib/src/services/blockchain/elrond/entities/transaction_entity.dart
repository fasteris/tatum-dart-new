import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'transaction_entity.g.dart';

@JsonSerializable()
class EgldTransactionEntity {
  final String? type;
  final int? nonce;
  final int? round;
  final int? epoch;
  final String? value;
  final String? receiver;
  final String? sender;
  final int? gasPrice;
  final int? gasLimit;
  final String? data;
  final String? signature;
  final int? sourceShard;
  final int? destinationShard;
  final int? blockNonce;
  final String? blockHash;
  final String? miniblockHash;
  final String? timestamp;
  final String? status;
  final int? hyperblockNonce;
  final String? hyperblockHash;

  EgldTransactionEntity(
      {this.type,
      this.nonce,
      this.round,
      this.blockHash,
      this.blockNonce,
      this.data,
      this.destinationShard,
      this.epoch,
      this.gasLimit,
      this.gasPrice,
      this.hyperblockHash,
      this.hyperblockNonce,
      this.miniblockHash,
      this.receiver,
      this.sender,
      this.signature,
      this.sourceShard,
      this.status,
      this.timestamp,
      this.value});

  factory EgldTransactionEntity.fromJson(Map<String, dynamic>? json) =>
      _$EgldTransactionEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$EgldTransactionEntityToJson(this);
}
