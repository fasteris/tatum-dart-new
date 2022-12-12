import 'package:json_annotation/json_annotation.dart';

part 'get_bitcoin_bc_info_response.g.dart';

@JsonSerializable()
class GetBitcoinBCInfoResponse {
  final String chain;
  final int blocks;
  final int headers;
  @JsonKey(name: 'bestblockhash')
  final String bestBlockHash;
  final int difficulty;

  GetBitcoinBCInfoResponse(
      {required this.chain,
      required this.blocks,
      required this.headers,
      required this.bestBlockHash,
      required this.difficulty});

  factory GetBitcoinBCInfoResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBitcoinBCInfoResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBitcoinBCInfoResponseToJson(this);
}
