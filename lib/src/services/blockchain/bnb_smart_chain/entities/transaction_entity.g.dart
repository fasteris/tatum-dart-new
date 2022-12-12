// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) =>
    TransactionEntity(
      blockHash: json['blockHash'] as String,
      blockNumber: json['blockNumber'] as int,
      contractAddress: json['contractAddress'] as String,
      cumulativeGasUsed: json['cumulativeGasUsed'] as int,
      from: json['from'] as String,
      gas: json['gas'] as int,
      gasPrice: json['gasPrice'] as String,
      gasUsed: json['gasUsed'] as int,
      input: json['input'] as String,
      logs: (json['logs'] as List<dynamic>)
          .map((e) => LogsEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      nonce: json['nonce'] as int,
      status: json['status'] as bool,
      to: json['to'] as String,
      transactionHash: json['transactionHash'] as String,
      trasactionIndex: json['trasactionIndex'] as int,
      value: json['value'] as String,
    );

Map<String, dynamic> _$TransactionEntityToJson(TransactionEntity instance) =>
    <String, dynamic>{
      'blockHash': instance.blockHash,
      'status': instance.status,
      'blockNumber': instance.blockNumber,
      'from': instance.from,
      'gas': instance.gas,
      'gasPrice': instance.gasPrice,
      'transactionHash': instance.transactionHash,
      'input': instance.input,
      'nonce': instance.nonce,
      'to': instance.to,
      'trasactionIndex': instance.trasactionIndex,
      'value': instance.value,
      'gasUsed': instance.gasUsed,
      'cumulativeGasUsed': instance.cumulativeGasUsed,
      'contractAddress': instance.contractAddress,
      'logs': instance.logs,
    };
