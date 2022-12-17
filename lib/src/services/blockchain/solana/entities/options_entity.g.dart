// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionsEntity _$OptionsEntityFromJson(Map<String, dynamic> json) =>
    OptionsEntity(
      commitment: json['commitment'] as String,
      preflightCommitment: json['preflightCommitment'] as String,
    );

Map<String, dynamic> _$OptionsEntityToJson(OptionsEntity instance) =>
    <String, dynamic>{
      'commitment': instance.commitment,
      'preflightCommitment': instance.preflightCommitment,
    };
