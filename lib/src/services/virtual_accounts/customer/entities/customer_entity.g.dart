// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerEntity _$CustomerEntityFromJson(Map<String, dynamic> json) =>
    CustomerEntity(
      id: json['id'] as String?,
      externalId: json['externalId'] as String?,
      enabled: json['enabled'] as bool?,
      active: json['active'] as bool?,
      accountingCurrency: json['accountingCurrency'] as String?,
      customerCountry: json['customerCountry'] as String?,
      providerCountry: json['providerCountry'] as String?,
    );

Map<String, dynamic> _$CustomerEntityToJson(CustomerEntity instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'id': instance.id,
      'enabled': instance.enabled,
      'active': instance.active,
      'accountingCurrency': instance.accountingCurrency,
      'customerCountry': instance.customerCountry,
      'providerCountry': instance.providerCountry,
    };
