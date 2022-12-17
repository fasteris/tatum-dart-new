// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockEntity _$BlockEntityFromJson(Map<String, dynamic> json) => BlockEntity(
      shardID: json['shardID'] as int,
      blockNumber: json['blockNumber'] as int,
    );

Map<String, dynamic> _$BlockEntityToJson(BlockEntity instance) =>
    <String, dynamic>{
      'shardID': instance.shardID,
      'blockNumber': instance.blockNumber,
    };
