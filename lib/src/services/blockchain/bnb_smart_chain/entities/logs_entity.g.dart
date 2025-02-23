// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogsEntity _$LogsEntityFromJson(Map<String, dynamic> json) => LogsEntity(
      address: json['address'] as String,
      data: json['data'] as String,
      logIndex: (json['logIndex'] as num).toInt(),
      topics:
          (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
      transactionHash: json['transactionHash'] as String,
      transactionIndex: (json['transactionIndex'] as num).toInt(),
    );

Map<String, dynamic> _$LogsEntityToJson(LogsEntity instance) =>
    <String, dynamic>{
      'address': instance.address,
      'topics': instance.topics,
      'data': instance.data,
      'logIndex': instance.logIndex,
      'transactionIndex': instance.transactionIndex,
      'transactionHash': instance.transactionHash,
    };
