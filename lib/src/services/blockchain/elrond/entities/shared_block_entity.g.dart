// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_block_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedBlockEntity _$SharedBlockEntityFromJson(Map<String, dynamic> json) =>
    SharedBlockEntity(
      hash: json['hash'] as String,
      nonce: (json['nonce'] as num).toInt(),
      shard: (json['shard'] as num).toInt(),
    );

Map<String, dynamic> _$SharedBlockEntityToJson(SharedBlockEntity instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'nonce': instance.nonce,
      'shard': instance.shard,
    };
