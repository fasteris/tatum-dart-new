// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bcash_block_by_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBCashBlockByHashResponse _$GetBCashBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    GetBCashBlockByHashResponse(
      hash: json['hash'] as String,
      size: json['size'] as int,
      height: json['height'] as int,
      merkleRoot: json['merkleRoot'] as String,
      tx: (json['tx'] as List<dynamic>)
          .map((e) =>
              GetBCashTransactionResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
      version: json['version'] as int,
      confirmations: json['confirmations'] as int,
      difficulty: json['difficulty'] as int,
      nextBlockHash: json['nextblockhash'] as String,
      nonce: json['nonce'] as int,
      previousBlockHash: json['previousblockhash'] as String,
      time: json['time'] as int,
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$GetBCashBlockByHashResponseToJson(
        GetBCashBlockByHashResponse instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'size': instance.size,
      'height': instance.height,
      'version': instance.version,
      'merkleRoot': instance.merkleRoot,
      'tx': instance.tx,
      'time': instance.time,
      'nonce': instance.nonce,
      'difficulty': instance.difficulty,
      'confirmations': instance.confirmations,
      'previousblockhash': instance.previousBlockHash,
      'nextblockhash': instance.nextBlockHash,
      'weight': instance.weight,
    };
