import 'package:json_annotation/json_annotation.dart';

part 'energy_response.g.dart';

@JsonSerializable()
class EnergyResponse {
  final String? energy;

  EnergyResponse({this.energy});

  factory EnergyResponse.fromJson(Map<String, dynamic>? json) =>
      _$EnergyResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$EnergyResponseToJson(this);
}
