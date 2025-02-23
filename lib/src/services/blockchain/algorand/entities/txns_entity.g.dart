// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txns_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TXNSEntity _$TXNSEntityFromJson(Map<String, dynamic> json) => TXNSEntity(
      closeAmount: (json['closeAmount'] as num).toInt(),
      closeReward: (json['closeReward'] as num).toInt(),
      confirmedRound: (json['confirmedRound'] as num).toInt(),
      fee: (json['fee'] as num).toInt(),
      firstValid: (json['firstValid'] as num).toInt(),
      genesisHash: json['genesisHash'] as String,
      genesisId: json['genesisId'] as String,
      id: json['id'] as String,
      intraRoundOffset: (json['intraRoundOffset'] as num).toInt(),
      lastValid: (json['lastValid'] as num).toInt(),
      note: json['note'] as String,
      receiverRewards: (json['receiverRewards'] as num).toInt(),
      roundTime: (json['roundTime'] as num).toInt(),
      sender: json['sender'] as String,
      senderRewards: (json['senderRewards'] as num).toInt(),
      txType: json['txType'] as String,
    );

Map<String, dynamic> _$TXNSEntityToJson(TXNSEntity instance) =>
    <String, dynamic>{
      'closeReward': instance.closeReward,
      'closeAmount': instance.closeAmount,
      'confirmedRound': instance.confirmedRound,
      'fee': instance.fee,
      'firstValid': instance.firstValid,
      'genesisHash': instance.genesisHash,
      'genesisId': instance.genesisId,
      'id': instance.id,
      'intraRoundOffset': instance.intraRoundOffset,
      'lastValid': instance.lastValid,
      'note': instance.note,
      'receiverRewards': instance.receiverRewards,
      'roundTime': instance.roundTime,
      'sender': instance.sender,
      'senderRewards': instance.senderRewards,
      'txType': instance.txType,
    };
