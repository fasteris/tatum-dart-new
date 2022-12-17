// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountResponse _$CreateAccountResponseFromJson(
        Map<String, dynamic> json) =>
    CreateAccountResponse(
      id: json['id'] as String?,
      accountCode: json['accountCode'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountingCurrency: json['accountingCurrency'] as String?,
      active: json['active'] as bool?,
      balance: json['balance'] == null
          ? null
          : BalanceEntity.fromJson(json['balance'] as Map<String, dynamic>?),
      currency: json['currency'] as String?,
      customerId: json['customerId'] as String?,
      frozen: json['frozen'] as bool?,
      xpub: json['xpub'] as String?,
    );

Map<String, dynamic> _$CreateAccountResponseToJson(
        CreateAccountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': instance.currency,
      'frozen': instance.frozen,
      'active': instance.active,
      'customerId': instance.customerId,
      'accountNumber': instance.accountNumber,
      'accountCode': instance.accountCode,
      'accountingCurrency': instance.accountingCurrency,
      'xpub': instance.xpub,
    };
