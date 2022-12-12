import 'package:json_annotation/json_annotation.dart';

part 'logs_entity.g.dart';

@JsonSerializable()
class LogsEntity {
  final String address;
  final List<String> topics;
  final String data;
  final int logIndex;
  final int transactionIndex;
  final String transactionHash;

  LogsEntity(
      {required this.address,
      required this.data,
      required this.logIndex,
      required this.topics,
      required this.transactionHash,
      required this.transactionIndex});

  factory LogsEntity.fromJson(Map<String, dynamic>? json) =>
      _$LogsEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$LogsEntityToJson(this);
}
