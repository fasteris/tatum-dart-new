import 'package:json_annotation/json_annotation.dart';

part 'deploy_token_response.g.dart';

@JsonSerializable()
class DeployTokenResponse {
  final String? accountId;
  final String? txId;

  DeployTokenResponse({this.accountId, this.txId});

  factory DeployTokenResponse.fromJson(Map<String, dynamic>? json) =>
      _$DeployTokenResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$DeployTokenResponseToJson(this);
}
