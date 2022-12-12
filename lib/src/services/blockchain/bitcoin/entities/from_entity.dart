import 'package:json_annotation/json_annotation.dart';

part 'from_entity.g.dart';

@JsonSerializable()
class FromEntity {
  final String address;
  final String privateKey;

  FromEntity({required this.address, required this.privateKey});

  factory FromEntity.fromJson(Map<String, dynamic>? json) =>
      _$FromEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$FromEntityToJson(this);
}
