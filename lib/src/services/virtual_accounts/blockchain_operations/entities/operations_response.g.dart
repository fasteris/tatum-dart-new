// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationsResponse _$OperationsResponseFromJson(Map<String, dynamic> json) =>
    OperationsResponse(
      id: json['id'] as String?,
      completed: json['completed'] as bool?,
      txId: json['txId'] as String?,
    );

Map<String, dynamic> _$OperationsResponseToJson(OperationsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'txId': instance.txId,
      'completed': instance.completed,
    };
