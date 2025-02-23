// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egld_block_by_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EGLDBlockByHashResponse _$EGLDBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    EGLDBlockByHashResponse(
      hash: json['hash'] as String?,
      nonce: (json['nonce'] as num?)?.toInt(),
      round: (json['round'] as num?)?.toInt(),
      epoch: (json['epoch'] as num?)?.toInt(),
      numTxs: (json['numTxs'] as num?)?.toInt(),
      prevBlockHash: json['prevBlockHash'] as String?,
      shardBlocks: (json['shardBlocks'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SharedBlockEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : EgldTransactionEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$EGLDBlockByHashResponseToJson(
        EGLDBlockByHashResponse instance) =>
    <String, dynamic>{
      'round': instance.round,
      'nonce': instance.nonce,
      'hash': instance.hash,
      'prevBlockHash': instance.prevBlockHash,
      'epoch': instance.epoch,
      'numTxs': instance.numTxs,
      'shardBlocks': instance.shardBlocks,
      'transactions': instance.transactions,
    };
