// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVirtualCurrencyResponse _$GetVirtualCurrencyResponseFromJson(
        Map<String, dynamic> json) =>
    GetVirtualCurrencyResponse(
      name: json['name'] as String?,
      accountId: json['accountId'] as String?,
      basePair: json['basePair'] as String?,
      baseRate: (json['baseRate'] as num?)?.toInt(),
      chain: json['chain'] as String?,
      customerId: json['customerId'] as String?,
      description: json['description'] as String?,
      erc20Address: json['erc20Address'] as String?,
      initialAddress: json['initialAddress'] as String?,
      issuerAccount: json['issuerAccount'] as String?,
      precision: (json['precision'] as num?)?.toInt(),
      supply: json['supply'] as String?,
      trcType: json['trcType'] as String?,
      xpub: json['xpub'] as String?,
    );

Map<String, dynamic> _$GetVirtualCurrencyResponseToJson(
        GetVirtualCurrencyResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'supply': instance.supply,
      'accountId': instance.accountId,
      'baseRate': instance.baseRate,
      'precision': instance.precision,
      'trcType': instance.trcType,
      'basePair': instance.basePair,
      'customerId': instance.customerId,
      'description': instance.description,
      'xpub': instance.xpub,
      'erc20Address': instance.erc20Address,
      'issuerAccount': instance.issuerAccount,
      'chain': instance.chain,
      'initialAddress': instance.initialAddress,
    };
