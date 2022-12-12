// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_binance_tx_by_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBinanceTxByAddressResponse _$GetBinanceTxByAddressResponseFromJson(
        Map<String, dynamic> json) =>
    GetBinanceTxByAddressResponse(
      total: json['total'] as int,
      tx: (json['tx'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$GetBinanceTxByAddressResponseToJson(
        GetBinanceTxByAddressResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'tx': instance.tx,
    };
