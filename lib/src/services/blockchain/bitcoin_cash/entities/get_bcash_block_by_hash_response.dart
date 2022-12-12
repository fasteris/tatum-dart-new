import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/bcash_tx_response.dart';

part 'get_bcash_block_by_hash_response.g.dart';

@JsonSerializable()
class GetBCashBlockByHashResponse {
  final String hash;
  final int size;
  final int height;
  final int version;
  final String merkleRoot;
  final List<GetBCashTransactionResponse> tx;
  final int time;
  final int nonce;
  final int difficulty;
  final int confirmations;
  @JsonKey(name: 'previousblockhash')
  final String previousBlockHash;
  @JsonKey(name: 'nextblockhash')
  final String nextBlockHash;

  GetBCashBlockByHashResponse(
      {required this.hash,
      required this.size,
      required this.height,
      required this.merkleRoot,
      required this.tx,
      required this.version,
      required this.confirmations,
      required this.difficulty,
      required this.nextBlockHash,
      required this.nonce,
      required this.previousBlockHash,
      required this.time});

  factory GetBCashBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBCashBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBCashBlockByHashResponseToJson(this);
}
