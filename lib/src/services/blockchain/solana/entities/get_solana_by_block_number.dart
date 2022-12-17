import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/rewards_entity.dart';

part 'get_solana_by_block_number.g.dart';

@JsonSerializable()
class GetSolanaBlockByNumberResponse {
  final int? blockHeight;
  final int? blockTime;
  final String? blockhash;
  final int? parentSlot;
  final String? previousBlockhash;
  final List<RewadsEntity>? rewards;
  final dynamic? transactions;

  GetSolanaBlockByNumberResponse(
      {this.blockHeight,
      this.blockTime,
      this.blockhash,
      this.parentSlot,
      this.previousBlockhash,
      this.rewards,
      this.transactions});

  factory GetSolanaBlockByNumberResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetSolanaBlockByNumberResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetSolanaBlockByNumberResponseToJson(this);
}
