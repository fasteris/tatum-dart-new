// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litecoin_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LitecoinTransactionResponse _$LitecoinTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    LitecoinTransactionResponse(
      txid: json['txid'] as String,
      vin: json['vin'] as List<dynamic>,
      locktime: (json['locktime'] as num).toInt(),
      vout: json['vout'] as List<dynamic>,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$LitecoinTransactionResponseToJson(
        LitecoinTransactionResponse instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'version': instance.version,
      'locktime': instance.locktime,
      'vin': instance.vin,
      'vout': instance.vout,
    };
