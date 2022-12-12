import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_binance_account_response.g.dart';

@JsonSerializable()
class GetBinanceAccountResponse {
  @JsonKey(name: 'account_number')
  final int accountNumber;
  final String address;
  final List<BalanceEntity> balances;
  final int flags;
  final int sequence;

  GetBinanceAccountResponse(
      {required this.accountNumber, required this.address, required this.balances, required this.flags, required this.sequence});

  factory GetBinanceAccountResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBinanceAccountResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBinanceAccountResponseToJson(this);
}
