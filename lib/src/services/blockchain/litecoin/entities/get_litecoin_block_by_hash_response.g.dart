// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_litecoin_block_by_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLitecoinBlockByHashResponse _$GetLitecoinBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    GetLitecoinBlockByHashResponse(
      hash: json['hash'] as String,
      size: json['size'] as int,
      height: json['height'] as int,
      merkleRoot: json['merkleRoot'] as String,
      tx: (json['tx'] as List<dynamic>)
          .map((e) =>
              LitecoinTransactionResponse.fromJson(e as Map<String, dynamic>?))
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

Map<String, dynamic> _$GetLitecoinBlockByHashResponseToJson(
        GetLitecoinBlockByHashResponse instance) =>
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
