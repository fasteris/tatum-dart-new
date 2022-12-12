import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/algorand/entities/asset_entity.dart';
import 'package:tatum/src/services/algorand/entities/rewards_entity.dart';
import 'package:tatum/src/services/algorand/entities/txns_entity.dart';
import 'package:tatum/src/services/algorand/entities/upgrade_state_entity.dart';
import 'package:tatum/src/services/algorand/entities/upgrade_vote_entity.dart';

part 'get_algorand_by_block_number_response.g.dart';

@JsonSerializable()
class GetAlgorandByBlockResponse {
  final String genesisHash;
  final String genesisId;
  final String previousBlockHash;
  final int round;
  final String seed;
  final int timestamp;
  final String txn;
  final int txnc;
  final List<TXNSEntity> txns;
  final RewadsEntity rewards;
  final UpgradeStateEntity upgradeState;
  final UpgradeVoteEntity upgradeVotes;

  GetAlgorandByBlockResponse(
      {required this.previousBlockHash,
      required this.genesisHash,
      required this.genesisId,
      required this.round,
      required this.seed,
      required this.timestamp,
      required this.txn,
      required this.txnc,
      required this.txns,
      required this.rewards,
      required this.upgradeState,
      required this.upgradeVotes});

  factory GetAlgorandByBlockResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetAlgorandByBlockResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetAlgorandByBlockResponseToJson(this);
}
