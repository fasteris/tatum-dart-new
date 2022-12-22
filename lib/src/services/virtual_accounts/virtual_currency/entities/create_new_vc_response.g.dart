// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_vc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVirtualCurrencyResponse _$CreateVirtualCurrencyResponseFromJson(
        Map<String, dynamic> json) =>
    CreateVirtualCurrencyResponse(
      id: json['id'] as String?,
      balance: json['balance'],
      frozen: json['frozen'] as bool?,
      active: json['active'] as bool?,
      accountingCurrency: json['accountingCurrency'] as String?,
      customerId: json['customerId'] as String?,
      accountNumber: json['accountNumber'] as String?,
      xpub: json['xpub'] as String?,
    );

Map<String, dynamic> _$CreateVirtualCurrencyResponseToJson(
        CreateVirtualCurrencyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'frozen': instance.frozen,
      'active': instance.active,
      'customerId': instance.customerId,
      'accountNumber': instance.accountNumber,
      'accountingCurrency': instance.accountingCurrency,
      'xpub': instance.xpub,
    };
