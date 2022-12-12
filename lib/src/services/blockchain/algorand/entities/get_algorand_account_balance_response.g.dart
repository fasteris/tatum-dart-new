// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_algorand_account_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAlgorandAccountBalanceResponse _$GetAlgorandAccountBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    GetAlgorandAccountBalanceResponse(
      asset: json['asset'] as List<AssetEntity>,
      balance: json['balance'] as int,
    );

Map<String, dynamic> _$GetAlgorandAccountBalanceResponseToJson(
        GetAlgorandAccountBalanceResponse instance) =>
    <String, dynamic>{
      'asset': instance.asset,
      'balance': instance.balance,
    };
