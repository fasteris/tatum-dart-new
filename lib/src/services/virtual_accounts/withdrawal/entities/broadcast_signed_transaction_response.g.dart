// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_signed_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BroadcastSignedTxResponse _$BroadcastSignedTxResponseFromJson(
        Map<String, dynamic> json) =>
    BroadcastSignedTxResponse(
      completed: json['completed'] as bool?,
      txId: json['txId'] as String?,
    );

Map<String, dynamic> _$BroadcastSignedTxResponseToJson(
        BroadcastSignedTxResponse instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'txId': instance.txId,
    };
