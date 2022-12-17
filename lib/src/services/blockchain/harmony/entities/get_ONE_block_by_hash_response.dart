import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_ONE_block_by_hash_response.g.dart';

@JsonSerializable()
class GetONEBlockByHashResponse {
  final String difficulty;
  final String extraData;
  final int gasLimit;
  final int gasUsed;
  final String hash;
  final String logsBloom;
  final String miner;
  final String mixHash;
  final String nonce;
  final int number;
  final String parentHash;
  final String receiptsRoot;
  final String sha3Uncles;
  final int size;
  final String stateRoot;
  final int timeStamp;
  final String totalDifficulty;
  final List<TransactionEntity> transactions;
  final String transactionsRoot;

  GetONEBlockByHashResponse(
      {required this.difficulty,
      required this.extraData,
      required this.gasLimit,
      required this.gasUsed,
      required this.hash,
      required this.logsBloom,
      required this.miner,
      required this.mixHash,
      required this.nonce,
      required this.number,
      required this.parentHash,
      required this.receiptsRoot,
      required this.sha3Uncles,
      required this.size,
      required this.stateRoot,
      required this.timeStamp,
      required this.totalDifficulty,
      required this.transactions,
      required this.transactionsRoot});

  factory GetONEBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetONEBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetONEBlockByHashResponseToJson(this);
}
