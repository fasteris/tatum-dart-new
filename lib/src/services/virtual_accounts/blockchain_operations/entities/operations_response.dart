import 'package:json_annotation/json_annotation.dart';

part 'operations_response.g.dart';

@JsonSerializable()
class OperationsResponse {
  final String? id;
  final String? txId;
  final bool? completed;

  OperationsResponse({this.id, this.completed, this.txId});

  factory OperationsResponse.fromJson(Map<String, dynamic>? json) =>
      _$OperationsResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$OperationsResponseToJson(this);
}
