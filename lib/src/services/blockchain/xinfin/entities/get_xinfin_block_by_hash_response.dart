import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_xinfin_block_by_hash_response.g.dart';

@JsonSerializable()
class GetXinFinBlockByHashResponse {
  final String? difficulty;
  final String? extraData;
  final int? gasLimit;
  final int? gasUsed;
  final String? hash;
  final String? logsBloom;
  final String? miner;
  final String? mixHash;
  final String? nonce;
  final int? number;
  final String? parentHash;
  final String? receiptsRoot;
  final String? sha3Uncles;
  final int? size;
  final String? stateRoot;
  final int? timeStamp;
  final String? totalDifficulty;
  final List<TransactionEntity>? transactions;
  final String? transactionsRoot;
  final List<String>? uncles;

  GetXinFinBlockByHashResponse(
      {this.difficulty,
      this.extraData,
      this.gasLimit,
      this.gasUsed,
      this.hash,
      this.logsBloom,
      this.miner,
      this.mixHash,
      this.nonce,
      this.number,
      this.parentHash,
      this.receiptsRoot,
      this.sha3Uncles,
      this.size,
      this.stateRoot,
      this.timeStamp,
      this.totalDifficulty,
      this.transactions,
      this.transactionsRoot,
      this.uncles});

  factory GetXinFinBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetXinFinBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetXinFinBlockByHashResponseToJson(this);
}
