// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountEntity _$AmountEntityFromJson(Map<String, dynamic> json) => AmountEntity(
      id: json['id'] as String?,
      accountId: json['accountId'] as String?,
      amount: json['amount'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AmountEntityToJson(AmountEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'amount': instance.amount,
      'type': instance.type,
      'description': instance.description,
    };
