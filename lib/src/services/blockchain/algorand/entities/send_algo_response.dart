import 'package:json_annotation/json_annotation.dart';

part 'send_algo_response.g.dart';

@JsonSerializable()
class SendAlgoResponse {
  final String txId;

  SendAlgoResponse({required this.txId});

  factory SendAlgoResponse.fromJson(Map<String, dynamic>? json) =>
      _$SendAlgoResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$SendAlgoResponseToJson(this);
}
