import 'package:json_annotation/json_annotation.dart';

part 'to_entity.g.dart';

@JsonSerializable()
class ToEntity {
  final String address;
  final int value;

  ToEntity({required this.address, required this.value});

  factory ToEntity.fromJson(Map<String, dynamic>? json) =>
      _$ToEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$ToEntityToJson(this);
}
