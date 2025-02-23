// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_algorand_by_block_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAlgorandByBlockResponse _$GetAlgorandByBlockResponseFromJson(
        Map<String, dynamic> json) =>
    GetAlgorandByBlockResponse(
      previousBlockHash: json['previousBlockHash'] as String,
      genesisHash: json['genesisHash'] as String,
      genesisId: json['genesisId'] as String,
      round: (json['round'] as num).toInt(),
      seed: json['seed'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      txn: json['txn'] as String,
      txnc: (json['txnc'] as num).toInt(),
      txns: (json['txns'] as List<dynamic>)
          .map((e) => TXNSEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      rewards: RewadsEntity.fromJson(json['rewards'] as Map<String, dynamic>?),
      upgradeState: UpgradeStateEntity.fromJson(
          json['upgradeState'] as Map<String, dynamic>?),
      upgradeVotes: UpgradeVoteEntity.fromJson(
          json['upgradeVotes'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$GetAlgorandByBlockResponseToJson(
        GetAlgorandByBlockResponse instance) =>
    <String, dynamic>{
      'genesisHash': instance.genesisHash,
      'genesisId': instance.genesisId,
      'previousBlockHash': instance.previousBlockHash,
      'round': instance.round,
      'seed': instance.seed,
      'timestamp': instance.timestamp,
      'txn': instance.txn,
      'txnc': instance.txnc,
      'txns': instance.txns,
      'rewards': instance.rewards,
      'upgradeState': instance.upgradeState,
      'upgradeVotes': instance.upgradeVotes,
    };
