import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/txs_entity.dart';

part 'get_bitcoin_block_hash_response.g.dart';

@JsonSerializable()
class GetBitcoinBlockByHashResponse {
  final String hash;
  final int height;
  final int depth;
  final int version;
  final String prevBlock;
  final String merkleRoot;
  final int time;
  final int bits;
  final int nonce;
  final List<TXSEntity> txs;

  GetBitcoinBlockByHashResponse(
      {required this.hash,
      required this.bits,
      required this.depth,
      required this.height,
      required this.merkleRoot,
      required this.nonce,
      required this.prevBlock,
      required this.time,
      required this.txs,
      required this.version});

  factory GetBitcoinBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBitcoinBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBitcoinBlockByHashResponseToJson(this);
}
