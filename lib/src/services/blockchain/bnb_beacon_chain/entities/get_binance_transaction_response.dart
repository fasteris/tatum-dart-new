import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_binance_transaction_response.g.dart';

@JsonSerializable()
class GetBinanceTransactionResponse {
  final int code;
  final String hash;
  final String height;
  final String log;
  final bool ok;
  final Map<String, dynamic> tx;

  GetBinanceTransactionResponse(
      {required this.code,
      required this.hash,
      required this.height,
      required this.log,
      required this.ok,
      required this.tx});

  factory GetBinanceTransactionResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBinanceTransactionResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBinanceTransactionResponseToJson(this);
}
