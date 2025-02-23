// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ethereum_tr_by_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEthereumTrByAddressResponse _$GetEthereumTrByAddressResponseFromJson(
        Map<String, dynamic> json) =>
    GetEthereumTrByAddressResponse(
      tx: (json['tx'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetEthereumTrByAddressResponseToJson(
        GetEthereumTrByAddressResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'tx': instance.tx,
    };
