import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_bbc_transaction_block_response.g.dart';

@JsonSerializable()
class GetBinanceTxInBlockResponse {
  @JsonKey(name: 'timestamp')
  final int timeStamp;
  final int blockHeight;
  final List<TransactionEntity> tx;

  GetBinanceTxInBlockResponse(
      {required this.timeStamp, required this.blockHeight, required this.tx});

  factory GetBinanceTxInBlockResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBinanceTxInBlockResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBinanceTxInBlockResponseToJson(this);
}
