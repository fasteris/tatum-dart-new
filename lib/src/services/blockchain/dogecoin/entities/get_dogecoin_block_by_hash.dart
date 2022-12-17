import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/bcash_tx_response.dart';

part 'get_dogecoin_block_by_hash.g.dart';

@JsonSerializable()
class GetDogecoinBlockByHashResponse {
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
  final int? weight;

  GetDogecoinBlockByHashResponse(
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
      required this.time,
      this.weight});

  factory GetDogecoinBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetDogecoinBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetDogecoinBlockByHashResponseToJson(this);
}
