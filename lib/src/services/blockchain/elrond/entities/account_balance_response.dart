import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/shared_block_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/transaction_entity.dart';

part 'account_balance_response.g.dart';

@JsonSerializable()
class AccountBalanceResponse {
  final String? balance;

  AccountBalanceResponse({this.balance});

  factory AccountBalanceResponse.fromJson(Map<String, dynamic>? json) =>
      _$AccountBalanceResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$AccountBalanceResponseToJson(this);
}
