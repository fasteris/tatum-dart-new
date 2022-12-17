import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_vechain_block_by_hash_response.g.dart';

@JsonSerializable()
class GetVeChainBlockByHashResponse {
  final String? id;
  final String? beneficiary;
  final int? gasLimit;
  final int? gasUsed;
  final int? totalScore;
  final int? number;
  final String? parentID;
  final int? size;
  final int? timeStamp;
  final List<String>? transactions;
  final String? txsRoot;
  final int? txsFeatures;
  final String? stateRoot;
  final String? receiptsRoot;
  final String? signer;

  GetVeChainBlockByHashResponse(
      {this.gasLimit,
      this.gasUsed,
      this.number,
      this.parentID,
      this.receiptsRoot,
      this.size,
      this.stateRoot,
      this.timeStamp,
      this.transactions,
      this.beneficiary,
      this.id,
      this.signer,
      this.totalScore,
      this.txsFeatures,
      this.txsRoot});

  factory GetVeChainBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetVeChainBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetVeChainBlockByHashResponseToJson(this);
}
