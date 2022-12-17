import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';

part 'create_account_response.g.dart';

@JsonSerializable()
class CreateAccountResponse {
  final String? id;
  final BalanceEntity? balance;
  final String? currency;
  final bool? frozen;
  final bool? active;
  final String? customerId;
  final String? accountNumber;
  final String? accountCode;
  final String? accountingCurrency;
  final String? xpub;

  CreateAccountResponse(
      {this.id,
      this.accountCode,
      this.accountNumber,
      this.accountingCurrency,
      this.active,
      this.balance,
      this.currency,
      this.customerId,
      this.frozen,
      this.xpub});

  factory CreateAccountResponse.fromJson(Map<String, dynamic>? json) =>
      _$CreateAccountResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$CreateAccountResponseToJson(this);
}
