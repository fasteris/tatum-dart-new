// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalTransactionEntity _$InternalTransactionEntityFromJson(
        Map<String, dynamic> json) =>
    InternalTransactionEntity(
      value: json['value'] as String?,
      blockNumber: json['blockNumber'] as int?,
      contractAddress: json['contractAddress'] as String?,
      errCode: json['errCode'] as String?,
      from: json['from'] as String?,
      gas: json['gas'] as int?,
      gasUsed: json['gasUsed'] as int?,
      hash: json['hash'] as String?,
      input: json['input'] as String?,
      isError: json['isError'] as String?,
      timeStamp: json['timeStamp'] as String?,
      to: json['to'] as String?,
      traceId: json['traceId'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$InternalTransactionEntityToJson(
        InternalTransactionEntity instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'value': instance.value,
      'blockNumber': instance.blockNumber,
      'timeStamp': instance.timeStamp,
      'hash': instance.hash,
      'input': instance.input,
      'traceId': instance.traceId,
      'type': instance.type,
      'errCode': instance.errCode,
      'gas': instance.gas,
      'isError': instance.isError,
      'gasUsed': instance.gasUsed,
      'contractAddress': instance.contractAddress,
    };
