// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_binance_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBinanceTransactionResponse _$GetBinanceTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    GetBinanceTransactionResponse(
      code: (json['code'] as num).toInt(),
      hash: json['hash'] as String,
      height: json['height'] as String,
      log: json['log'] as String,
      ok: json['ok'] as bool,
      tx: json['tx'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GetBinanceTransactionResponseToJson(
        GetBinanceTransactionResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'hash': instance.hash,
      'height': instance.height,
      'log': instance.log,
      'ok': instance.ok,
      'tx': instance.tx,
    };
