import 'package:json_annotation/json_annotation.dart';

part 'rewards_entity.g.dart';

@JsonSerializable()
class RewadsEntity {
  @JsonKey(name: 'fee-sink')
  final String feeSink;
  @JsonKey(name: 'rewards-calculation-round')
  final int rewardsCalculationRound;
  @JsonKey(name: 'rewards-level')
  final int rewardsLevel;
  @JsonKey(name: 'rewards-pool')
  final String rewardsPool;
  @JsonKey(name: 'rewards-rate')
  final int rewardsRate;
  @JsonKey(name: 'rewards-residue')
  final int rewardsResidue;

  RewadsEntity(
      {required this.feeSink,
      required this.rewardsCalculationRound,
      required this.rewardsLevel,
      required this.rewardsPool,
      required this.rewardsRate,
      required this.rewardsResidue});

  factory RewadsEntity.fromJson(Map<String, dynamic>? json) =>
      _$RewadsEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$RewadsEntityToJson(this);
}