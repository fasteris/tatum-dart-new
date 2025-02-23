// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bitcoin_bc_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBitcoinBCInfoResponse _$GetBitcoinBCInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetBitcoinBCInfoResponse(
      chain: json['chain'] as String,
      blocks: (json['blocks'] as num).toInt(),
      headers: (json['headers'] as num).toInt(),
      bestBlockHash: json['bestblockhash'] as String,
      difficulty: (json['difficulty'] as num).toInt(),
    );

Map<String, dynamic> _$GetBitcoinBCInfoResponseToJson(
        GetBitcoinBCInfoResponse instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'blocks': instance.blocks,
      'headers': instance.headers,
      'bestblockhash': instance.bestBlockHash,
      'difficulty': instance.difficulty,
    };
