// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bbc_transaction_block_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBinanceTxInBlockResponse _$GetBinanceTxInBlockResponseFromJson(
        Map<String, dynamic> json) =>
    GetBinanceTxInBlockResponse(
      timeStamp: json['timestamp'] as int,
      blockHeight: json['blockHeight'] as int,
      tx: (json['tx'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$GetBinanceTxInBlockResponseToJson(
        GetBinanceTxInBlockResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timeStamp,
      'blockHeight': instance.blockHeight,
      'tx': instance.tx,
    };
