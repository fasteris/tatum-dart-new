// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToEntity _$ToEntityFromJson(Map<String, dynamic> json) => ToEntity(
      address: json['address'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$ToEntityToJson(ToEntity instance) => <String, dynamic>{
      'address': instance.address,
      'value': instance.value,
    };
