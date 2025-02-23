// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bcash_block_by_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBCashBlockByHashResponse _$GetBCashBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    GetBCashBlockByHashResponse(
      hash: json['hash'] as String,
      size: (json['size'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      merkleRoot: json['merkleRoot'] as String,
      tx: (json['tx'] as List<dynamic>)
          .map((e) =>
              GetBCashTransactionResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
      version: (json['version'] as num).toInt(),
      confirmations: (json['confirmations'] as num).toInt(),
      difficulty: (json['difficulty'] as num).toInt(),
      nextBlockHash: json['nextblockhash'] as String,
      nonce: (json['nonce'] as num).toInt(),
      previousBlockHash: json['previousblockhash'] as String,
      time: (json['time'] as num).toInt(),
      weight: (json['weight'] as num?)?.toInt(),
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
