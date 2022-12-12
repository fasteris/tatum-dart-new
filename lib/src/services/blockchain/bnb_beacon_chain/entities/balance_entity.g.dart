// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceEntity _$BalanceEntityFromJson(Map<String, dynamic> json) =>
    BalanceEntity(
      fee: json['fee'] as String,
      frozen: json['frozen'] as String,
      locked: json['locked'] as String,
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$BalanceEntityToJson(BalanceEntity instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'frozen': instance.frozen,
      'locked': instance.locked,
      'symbol': instance.symbol,
    };
