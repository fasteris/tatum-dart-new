import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_celo_account_balance_response.g.dart';

@JsonSerializable()
class GetCeloAccountBalanceResponse {
  final String celo;
  final String cUsd;
  final String cEur;

  GetCeloAccountBalanceResponse(
      {required this.cEur, required this.cUsd, required this.celo});

  factory GetCeloAccountBalanceResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetCeloAccountBalanceResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetCeloAccountBalanceResponseToJson(this);
}
