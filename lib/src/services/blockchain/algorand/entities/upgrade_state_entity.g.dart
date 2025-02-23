// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeStateEntity _$UpgradeStateEntityFromJson(Map<String, dynamic> json) =>
    UpgradeStateEntity(
      currentProtocol: json['current-protocol'] as String,
      nextProtocolApprovals: (json['next-protocol-approvals'] as num).toInt(),
      nextProtocolSwitchOn: (json['next-protocol-switch-on'] as num).toInt(),
      nextProtocolVoteBefore:
          (json['next-protocol-vote-before'] as num).toInt(),
    );

Map<String, dynamic> _$UpgradeStateEntityToJson(UpgradeStateEntity instance) =>
    <String, dynamic>{
      'current-protocol': instance.currentProtocol,
      'next-protocol-approvals': instance.nextProtocolApprovals,
      'next-protocol-switch-on': instance.nextProtocolSwitchOn,
      'next-protocol-vote-before': instance.nextProtocolVoteBefore,
    };
