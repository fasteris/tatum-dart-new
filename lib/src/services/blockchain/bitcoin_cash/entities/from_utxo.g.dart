// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from_utxo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FromUTXO _$FromUTXOFromJson(Map<String, dynamic> json) => FromUTXO(
      txHash: json['txHash'] as String,
      index: (json['index'] as num).toInt(),
      privateKey: json['privateKey'] as String,
    );

Map<String, dynamic> _$FromUTXOToJson(FromUTXO instance) => <String, dynamic>{
      'txHash': instance.txHash,
      'index': instance.index,
      'privateKey': instance.privateKey,
    };
