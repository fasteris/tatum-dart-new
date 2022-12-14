import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/asset_entity.dart';

part 'upgrade_state_entity.g.dart';

@JsonSerializable()
class UpgradeStateEntity {
  @JsonKey(name: 'current-protocol')
  final String currentProtocol;
  @JsonKey(name: 'next-protocol-approvals')
  final int nextProtocolApprovals;
  @JsonKey(name: 'next-protocol-switch-on')
  final int nextProtocolSwitchOn;
  @JsonKey(name: 'next-protocol-vote-before')
  final int nextProtocolVoteBefore;
  UpgradeStateEntity({required this.currentProtocol, required this.nextProtocolApprovals, required this.nextProtocolSwitchOn, required this.nextProtocolVoteBefore});

  factory UpgradeStateEntity.fromJson(Map<String, dynamic>? json) =>
      _$UpgradeStateEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$UpgradeStateEntityToJson(this);
}
