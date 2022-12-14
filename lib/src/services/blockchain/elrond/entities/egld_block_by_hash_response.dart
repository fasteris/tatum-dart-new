import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/shared_block_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/transaction_entity.dart';

part 'egld_block_by_hash_response.g.dart';

@JsonSerializable()
class EGLDBlockByHashResponse {
  final int? round;
  final int? nonce;
  final String? hash;
  final String? prevBlockHash;
  final int? epoch;
  final int? numTxs;
  final List<SharedBlockEntity?>? shardBlocks;
  final List<EgldTransactionEntity?>? transactions;

  EGLDBlockByHashResponse(
      {required this.hash,
      this.nonce,
      this.round,
      this.epoch,
      this.numTxs,
      this.prevBlockHash,
      this.shardBlocks,
      this.transactions});

  factory EGLDBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$EGLDBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$EGLDBlockByHashResponseToJson(this);
}
