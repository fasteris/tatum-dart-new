// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBalanceResponse _$GetBalanceResponseFromJson(Map<String, dynamic> json) =>
    GetBalanceResponse(
      incoming: json['incoming'] as String,
      outgoing: json['outgoing'] as String,
    );

Map<String, dynamic> _$GetBalanceResponseToJson(GetBalanceResponse instance) =>
    <String, dynamic>{
      'incoming': instance.incoming,
      'outgoing': instance.outgoing,
    };
