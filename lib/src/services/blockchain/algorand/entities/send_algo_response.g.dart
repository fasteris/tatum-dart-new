// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_algo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendAlgoResponse _$SendAlgoResponseFromJson(Map<String, dynamic> json) =>
    SendAlgoResponse(
      txId: json['txId'] as String,
    );

Map<String, dynamic> _$SendAlgoResponseToJson(SendAlgoResponse instance) =>
    <String, dynamic>{
      'txId': instance.txId,
    };

TXIDResponse _$TXIDResponseFromJson(Map<String, dynamic> json) => TXIDResponse(
      txId: json['txId'] as String,
      confirmed: json['confirmed'] as String?,
    );

Map<String, dynamic> _$TXIDResponseToJson(TXIDResponse instance) =>
    <String, dynamic>{
      'txId': instance.txId,
      'confirmed': instance.confirmed,
    };
