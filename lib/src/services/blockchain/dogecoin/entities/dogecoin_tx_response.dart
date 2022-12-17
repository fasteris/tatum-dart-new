import 'package:json_annotation/json_annotation.dart';

part 'dogecoin_tx_response.g.dart';

@JsonSerializable()
class DogecoinTransactionResponse {
  final String txid;
  final int version;
  final int locktime;
  final List vin;
  final List<dynamic> vout;

  DogecoinTransactionResponse(
      {required this.txid,
      required this.vin,
      required this.locktime,
      required this.vout,
      required this.version});

  factory DogecoinTransactionResponse.fromJson(Map<String, dynamic>? json) =>
      _$DogecoinTransactionResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$DogecoinTransactionResponseToJson(this);
}
