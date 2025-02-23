// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_binance_tx_by_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBinanceTxByAddressResponse _$GetBinanceTxByAddressResponseFromJson(
        Map<String, dynamic> json) =>
    GetBinanceTxByAddressResponse(
      tx: (json['tx'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetBinanceTxByAddressResponseToJson(
        GetBinanceTxByAddressResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'tx': instance.tx,
    };
