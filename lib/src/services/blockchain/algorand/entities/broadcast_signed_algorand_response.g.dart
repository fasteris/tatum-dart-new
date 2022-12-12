// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_signed_algorand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BroadcastSignedAlgorandResponse _$BroadcastSignedAlgorandResponseFromJson(
        Map<String, dynamic> json) =>
    BroadcastSignedAlgorandResponse(
      txId: json['txId'] as String,
      assetIndex: json['assetIndex'] as int,
      confirmed: json['confirmed'] as bool,
      failed: json['failed'] as bool,
    );

Map<String, dynamic> _$BroadcastSignedAlgorandResponseToJson(
        BroadcastSignedAlgorandResponse instance) =>
    <String, dynamic>{
      'txId': instance.txId,
      'assetIndex': instance.assetIndex,
      'confirmed': instance.confirmed,
      'failed': instance.failed,
    };
