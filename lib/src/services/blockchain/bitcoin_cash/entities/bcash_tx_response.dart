import 'package:json_annotation/json_annotation.dart';

part 'bcash_tx_response.g.dart';

@JsonSerializable()
class GetBCashTransactionResponse {
  final String txid;
  final int version;
  final int locktime;
  final List vin;
  final List<dynamic> vout;

  GetBCashTransactionResponse(
      {required this.txid,
      required this.vin,
      required this.locktime,
      required this.vout,
      required this.version});

  factory GetBCashTransactionResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBCashTransactionResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBCashTransactionResponseToJson(this);
}
