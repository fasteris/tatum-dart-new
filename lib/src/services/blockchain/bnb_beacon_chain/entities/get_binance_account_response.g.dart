// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_binance_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBinanceAccountResponse _$GetBinanceAccountResponseFromJson(
        Map<String, dynamic> json) =>
    GetBinanceAccountResponse(
      accountNumber: (json['account_number'] as num).toInt(),
      address: json['address'] as String,
      balances: (json['balances'] as List<dynamic>)
          .map((e) => BalanceEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      flags: (json['flags'] as num).toInt(),
      sequence: (json['sequence'] as num).toInt(),
    );

Map<String, dynamic> _$GetBinanceAccountResponseToJson(
        GetBinanceAccountResponse instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'address': instance.address,
      'balances': instance.balances,
      'flags': instance.flags,
      'sequence': instance.sequence,
    };
