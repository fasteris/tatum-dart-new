// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_block_by_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlowBlockByHashResponse _$FlowBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    FlowBlockByHashResponse(
      id: json['id'] as String?,
      blockSeals: json['blockSeals'] as List<dynamic>?,
      height: json['height'] as int?,
      parentId: json['parentId'] as String?,
      signatures: (json['signatures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timestamp: json['timestamp'] as String?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FlowBlockByHashResponseToJson(
        FlowBlockByHashResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'height': instance.height,
      'timestamp': instance.timestamp,
      'transactions': instance.transactions,
      'signatures': instance.signatures,
      'blockSeals': instance.blockSeals,
    };
