// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewadsEntity _$RewadsEntityFromJson(Map<String, dynamic> json) => RewadsEntity(
      feeSink: json['fee-sink'] as String,
      rewardsCalculationRound:
          (json['rewards-calculation-round'] as num).toInt(),
      rewardsLevel: (json['rewards-level'] as num).toInt(),
      rewardsPool: json['rewards-pool'] as String,
      rewardsRate: (json['rewards-rate'] as num).toInt(),
      rewardsResidue: (json['rewards-residue'] as num).toInt(),
    );

Map<String, dynamic> _$RewadsEntityToJson(RewadsEntity instance) =>
    <String, dynamic>{
      'fee-sink': instance.feeSink,
      'rewards-calculation-round': instance.rewardsCalculationRound,
      'rewards-level': instance.rewardsLevel,
      'rewards-pool': instance.rewardsPool,
      'rewards-rate': instance.rewardsRate,
      'rewards-residue': instance.rewardsResidue,
    };
