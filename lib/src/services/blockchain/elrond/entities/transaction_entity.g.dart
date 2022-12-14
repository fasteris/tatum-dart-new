// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EgldTransactionEntity _$EgldTransactionEntityFromJson(
        Map<String, dynamic> json) =>
    EgldTransactionEntity(
      type: json['type'] as String?,
      nonce: json['nonce'] as int?,
      round: json['round'] as int?,
      blockHash: json['blockHash'] as String?,
      blockNonce: json['blockNonce'] as int?,
      data: json['data'] as String?,
      destinationShard: json['destinationShard'] as int?,
      epoch: json['epoch'] as int?,
      gasLimit: json['gasLimit'] as int?,
      gasPrice: json['gasPrice'] as int?,
      hyperblockHash: json['hyperblockHash'] as String?,
      hyperblockNonce: json['hyperblockNonce'] as int?,
      miniblockHash: json['miniblockHash'] as String?,
      receiver: json['receiver'] as String?,
      sender: json['sender'] as String?,
      signature: json['signature'] as String?,
      sourceShard: json['sourceShard'] as int?,
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
