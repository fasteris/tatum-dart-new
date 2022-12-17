import 'package:json_annotation/json_annotation.dart';

part 'litecoin_transaction_response.g.dart';

@JsonSerializable()
class LitecoinTransactionResponse {
  final String txid;
  final int version;
  final int locktime;
  final List vin;
  final List<dynamic> vout;

  LitecoinTransactionResponse(
      {required this.txid,
      required this.vin,
      required this.locktime,
      required this.vout,
      required this.version});

  factory LitecoinTransactionResponse.fromJson(Map<String, dynamic>? json) =>
      _$LitecoinTransactionResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$LitecoinTransactionResponseToJson(this);
}
