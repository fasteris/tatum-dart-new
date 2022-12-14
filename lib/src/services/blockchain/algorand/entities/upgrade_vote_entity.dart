import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/asset_entity.dart';

part 'upgrade_vote_entity.g.dart';

@JsonSerializable()
class UpgradeVoteEntity {
  @JsonKey(name: 'upgrade-approve')
  final String upgradeApprove;
  @JsonKey(name: 'upgrade-delay')
  final int upgradeDelay;
  UpgradeVoteEntity(
      {required this.upgradeDelay,
      required this.upgradeApprove});

  factory UpgradeVoteEntity.fromJson(Map<String, dynamic>? json) =>
      _$UpgradeVoteEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$UpgradeVoteEntityToJson(this);
}
