// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EgldTransactionEntity _$EgldTransactionEntityFromJson(
        Map<String, dynamic> json) =>
    EgldTransactionEntity(
      type: json['type'] as String?,
      nonce: (json['nonce'] as num?)?.toInt(),
      round: (json['round'] as num?)?.toInt(),
      blockHash: json['blockHash'] as String?,
      blockNonce: (json['blockNonce'] as num?)?.toInt(),
      data: json['data'] as String?,
      destinationShard: (json['destinationShard'] as num?)?.toInt(),
      epoch: (json['epoch'] as num?)?.toInt(),
      gasLimit: (json['gasLimit'] as num?)?.toInt(),
      gasPrice: (json['gasPrice'] as num?)?.toInt(),
      hyperblockHash: json['hyperblockHash'] as String?,
      hyperblockNonce: (json['hyperblockNonce'] as num?)?.toInt(),
      miniblockHash: json['miniblockHash'] as String?,
      receiver: json['receiver'] as String?,
      sender: json['sender'] as String?,
      signature: json['signature'] as String?,
      sourceShard: (json['sourceShard'] as num?)?.toInt(),
      status: json['status'] as String?,
      timestamp: json['timestamp'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$EgldTransactionEntityToJson(
        EgldTransactionEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'nonce': instance.nonce,
      'round': instance.round,
      'epoch': instance.epoch,
      'value': instance.value,
      'receiver': instance.receiver,
      'sender': instance.sender,
      'gasPrice': instance.gasPrice,
      'gasLimit': instance.gasLimit,
      'data': instance.data,
      'signature': instance.signature,
      'sourceShard': instance.sourceShard,
      'destinationShard': instance.destinationShard,
      'blockNonce': instance.blockNonce,
      'blockHash': instance.blockHash,
      'miniblockHash': instance.miniblockHash,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'hyperblockNonce': instance.hyperblockNonce,
      'hyperblockHash': instance.hyperblockHash,
    };
