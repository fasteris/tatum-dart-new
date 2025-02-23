// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_eth_block_by_hash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEthereumBlockByHashResponse _$GetEthereumBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    GetEthereumBlockByHashResponse(
      difficulty: json['difficulty'] as String,
      extraData: json['extraData'] as String,
      gasLimit: (json['gasLimit'] as num).toInt(),
      gasUsed: (json['gasUsed'] as num).toInt(),
      hash: json['hash'] as String,
      logsBloom: json['logsBloom'] as String,
      miner: json['miner'] as String,
      mixHash: json['mixHash'] as String,
      nonce: json['nonce'] as String,
      number: (json['number'] as num).toInt(),
      parentHash: json['parentHash'] as String,
      receiptsRoot: json['receiptsRoot'] as String,
      sha3Uncles: json['sha3Uncles'] as String,
      size: (json['size'] as num).toInt(),
      stateRoot: json['stateRoot'] as String,
      timeStamp: (json['timeStamp'] as num).toInt(),
      totalDifficulty: json['totalDifficulty'] as String,
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      transactionsRoot: json['transactionsRoot'] as String,
    );

Map<String, dynamic> _$GetEthereumBlockByHashResponseToJson(
        GetEthereumBlockByHashResponse instance) =>
    <String, dynamic>{
      'difficulty': instance.difficulty,
      'extraData': instance.extraData,
      'gasLimit': instance.gasLimit,
      'gasUsed': instance.gasUsed,
      'hash': instance.hash,
      'logsBloom': instance.logsBloom,
      'miner': instance.miner,
      'mixHash': instance.mixHash,
      'nonce': instance.nonce,
      'number': instance.number,
      'parentHash': instance.parentHash,
      'receiptsRoot': instance.receiptsRoot,
      'sha3Uncles': instance.sha3Uncles,
      'size': instance.size,
      'stateRoot': instance.stateRoot,
      'timeStamp': instance.timeStamp,
      'totalDifficulty': instance.totalDifficulty,
      'transactions': instance.transactions,
      'transactionsRoot': instance.transactionsRoot,
    };
