// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_celo_account_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCeloAccountBalanceResponse _$GetCeloAccountBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    GetCeloAccountBalanceResponse(
      cEur: json['cEur'] as String,
      cUsd: json['cUsd'] as String,
      celo: json['celo'] as String,
    );

Map<String, dynamic> _$GetCeloAccountBalanceResponseToJson(
        GetCeloAccountBalanceResponse instance) =>
    <String, dynamic>{
      'celo': instance.celo,
      'cUsd': instance.cUsd,
      'cEur': instance.cEur,
    };
