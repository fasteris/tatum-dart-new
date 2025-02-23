// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_algorand_account_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAlgorandAccountBalanceResponse _$GetAlgorandAccountBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    GetAlgorandAccountBalanceResponse(
      asset: (json['asset'] as List<dynamic>)
          .map((e) => AssetEntity.fromJson(e as Map<String, dynamic>?))
          .toList(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$GetAlgorandAccountBalanceResponseToJson(
        GetAlgorandAccountBalanceResponse instance) =>
    <String, dynamic>{
      'asset': instance.asset,
      'balance': instance.balance,
    };
