// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_vote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeVoteEntity _$UpgradeVoteEntityFromJson(Map<String, dynamic> json) =>
    UpgradeVoteEntity(
      upgradeDelay: json['upgrade-delay'] as int,
      upgradeApprove: json['upgrade-approve'] as String,
    );

Map<String, dynamic> _$UpgradeVoteEntityToJson(UpgradeVoteEntity instance) =>
    <String, dynamic>{
      'upgrade-approve': instance.upgradeApprove,
      'upgrade-delay': instance.upgradeDelay,
    };
