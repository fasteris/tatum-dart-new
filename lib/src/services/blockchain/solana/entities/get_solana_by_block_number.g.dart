// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_solana_by_block_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSolanaBlockByNumberResponse _$GetSolanaBlockByNumberResponseFromJson(
        Map<String, dynamic> json) =>
    GetSolanaBlockByNumberResponse(
      blockHeight: json['blockHeight'] as int?,
      blockTime: json['blockTime'] as int?,
      blockhash: json['blockhash'] as String?,
      parentSlot: json['parentSlot'] as int?,
      previousBlockhash: json['previousBlockhash'] as String?,
      rewards: (json['rewards'] as List<dynamic>?)
          ?.map((e) => RewadsEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      transactions: json['transactions'],
    );

Map<String, dynamic> _$GetSolanaBlockByNumberResponseToJson(
        GetSolanaBlockByNumberResponse instance) =>
    <String, dynamic>{
      'blockHeight': instance.blockHeight,
      'blockTime': instance.blockTime,
      'blockhash': instance.blockhash,
      'parentSlot': instance.parentSlot,
      'previousBlockhash': instance.previousBlockhash,
      'rewards': instance.rewards,
      'transactions': instance.transactions,
    };
