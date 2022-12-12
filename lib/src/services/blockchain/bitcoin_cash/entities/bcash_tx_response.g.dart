// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bcash_tx_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBCashTransactionResponse _$GetBCashTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    GetBCashTransactionResponse(
      txid: json['txid'] as String,
      vin: json['vin'] as List<dynamic>,
      locktime: json['locktime'] as int,
      vout: json['vout'] as List<dynamic>,
      version: json['version'] as int,
    );

Map<String, dynamic> _$GetBCashTransactionResponseToJson(
        GetBCashTransactionResponse instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'version': instance.version,
      'locktime': instance.locktime,
      'vin': instance.vin,
      'vout': instance.vout,
    };
