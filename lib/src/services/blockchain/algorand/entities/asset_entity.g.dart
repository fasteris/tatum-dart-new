// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetEntity _$AssetEntityFromJson(Map<String, dynamic> json) => AssetEntity(
      amount: (json['amount'] as num).toInt(),
      assetIndex: (json['assetIndex'] as num).toInt(),
    );

Map<String, dynamic> _$AssetEntityToJson(AssetEntity instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'assetIndex': instance.assetIndex,
    };
