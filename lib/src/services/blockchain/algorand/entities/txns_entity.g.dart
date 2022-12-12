// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txns_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TXNSEntity _$TXNSEntityFromJson(Map<String, dynamic> json) => TXNSEntity(
      closeAmount: json['closeAmount'] as int,
      closeReward: json['closeReward'] as int,
      confirmedRound: json['confirmedRound'] as int,
      fee: json['fee'] as int,
      firstValid: json['firstValid'] as int,
      genesisHash: json['genesisHash'] as String,
      genesisId: json['genesisId'] as String,
      id: json['id'] as String,
      intraRoundOffset: json['intraRoundOffset'] as int,
      lastValid: json['lastValid'] as int,
      note: json['note'] as String,
      receiverRewards: json['receiverRewards'] as int,
      roundTime: json['roundTime'] as int,
      sender: json['sender'] as String,
      senderRewards: json['senderRewards'] as int,
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
