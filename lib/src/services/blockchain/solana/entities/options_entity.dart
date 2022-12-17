import 'package:json_annotation/json_annotation.dart';

part 'options_entity.g.dart';

@JsonSerializable()
class OptionsEntity{
  final String commitment;
  final String preflightCommitment;

  OptionsEntity(
      {required this.commitment, required this.preflightCommitment});

  factory OptionsEntity.fromJson(Map<String, dynamic>? json) =>
      _$OptionsEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$OptionsEntityToJson(this);
}
