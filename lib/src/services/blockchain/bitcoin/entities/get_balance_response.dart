import 'package:json_annotation/json_annotation.dart';

part 'get_balance_response.g.dart';

@JsonSerializable()
class GetBalanceResponse {
  final String incoming;
  final String outgoing;

  GetBalanceResponse({required this.incoming, required this.outgoing});

  factory GetBalanceResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBalanceResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBalanceResponseToJson(this);
}
