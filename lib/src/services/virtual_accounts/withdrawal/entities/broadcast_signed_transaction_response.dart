import 'package:json_annotation/json_annotation.dart';

part 'broadcast_signed_transaction_response.g.dart';

@JsonSerializable()
class BroadcastSignedTxResponse {
  final bool? completed;
  final String? txId;

  BroadcastSignedTxResponse({this.completed, this.txId});

  factory BroadcastSignedTxResponse.fromJson(Map<String, dynamic>? json) =>
      _$BroadcastSignedTxResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$BroadcastSignedTxResponseToJson(this);
}
