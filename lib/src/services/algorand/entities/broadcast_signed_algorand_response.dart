import 'package:json_annotation/json_annotation.dart';

part 'broadcast_signed_algorand_response.g.dart';

@JsonSerializable()
class BroadcastSignedAlgorandResponse {
  final String txId;
  final int assetIndex;
  final bool confirmed;
  final bool failed;

  BroadcastSignedAlgorandResponse({required this.txId, required this.assetIndex, required this.confirmed, required this.failed});

  factory BroadcastSignedAlgorandResponse.fromJson(
          Map<String, dynamic>? json) =>
      _$BroadcastSignedAlgorandResponseFromJson(json!);

  Map<String, dynamic> toJson() =>
      _$BroadcastSignedAlgorandResponseToJson(this);
}
