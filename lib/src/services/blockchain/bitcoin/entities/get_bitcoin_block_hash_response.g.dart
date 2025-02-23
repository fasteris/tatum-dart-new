// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bitcoin_block_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBitcoinBlockByHashResponse _$GetBitcoinBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    GetBitcoinBlockByHashResponse(
      hash: json['hash'] as String,
      bits: (json['bits'] as num).toInt(),
      depth: (json['depth'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      merkleRoot: json['merkleRoot'] as String,
      nonce: (json['nonce'] as num).toInt(),
      prevBlock: json['prevBlock'] as String,
      time: (json['time'] as num).toInt(),
      txs: (json['txs'] as List<dynamic>)
          .map((e) => TXSEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$GetBitcoinBlockByHashResponseToJson(
        GetBitcoinBlockByHashResponse instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'height': instance.height,
      'depth': instance.depth,
      'version': instance.version,
      'prevBlock': instance.prevBlock,
      'merkleRoot': instance.merkleRoot,
      'time': instance.time,
      'bits': instance.bits,
      'nonce': instance.nonce,
      'txs': instance.txs,
    };
