// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_tron_block_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentTronBlock _$CurrentTronBlockFromJson(Map<String, dynamic> json) =>
    CurrentTronBlock(
      blockNumber: (json['blockNumber'] as num?)?.toInt(),
      hash: json['hash'] as String?,
      testnet: json['testnet'] as bool?,
    );

Map<String, dynamic> _$CurrentTronBlockToJson(CurrentTronBlock instance) =>
    <String, dynamic>{
      'blockNumber': instance.blockNumber,
      'hash': instance.hash,
      'testnet': instance.testnet,
    };
