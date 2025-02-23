// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) =>
    TransactionEntity(
      txHash: json['txHash'] as String,
      txAsset: json['txAsset'] as String,
      txFee: json['txFee'] as String,
      txType: json['txType'] as String,
      fromAddr: json['fromAddr'] as String,
      toAddr: json['toAddr'] as String,
      timeStamp: json['timeStamp'] as String,
      value: json['value'] as String,
      code: (json['code'] as num).toInt(),
      memo: json['memo'] as String,
      sequence: (json['sequence'] as num).toInt(),
      source: (json['source'] as num).toInt(),
      blockHeight: (json['blockHeight'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionEntityToJson(TransactionEntity instance) =>
    <String, dynamic>{
      'txHash': instance.txHash,
      'blockHeight': instance.blockHeight,
      'txType': instance.txType,
      'timeStamp': instance.timeStamp,
      'fromAddr': instance.fromAddr,
      'toAddr': instance.toAddr,
      'value': instance.value,
      'txAsset': instance.txAsset,
      'txFee': instance.txFee,
      'code': instance.code,
      'memo': instance.memo,
      'source': instance.source,
      'sequence': instance.sequence,
    };
