import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';

part 'tatum_response.g.dart';

@JsonSerializable()
class TatumResponse {
  final String? id;
  final dynamic data;

  TatumResponse({this.id, this.data});

  factory TatumResponse.fromJson(Map<String, dynamic>? json) =>
      _$TatumResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$TatumResponseToJson(this);
}
