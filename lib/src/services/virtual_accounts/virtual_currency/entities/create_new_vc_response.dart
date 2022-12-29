import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';

part 'create_new_vc_response.g.dart';

@JsonSerializable()
class CreateVirtualCurrencyResponse {
  final String? id;
  final dynamic balance;
  final bool? frozen;
  final bool? active;
  final String? customerId;
  final String? accountNumber;
  final String? accountingCurrency;
  final String? xpub;

  CreateVirtualCurrencyResponse(
      {this.id,
      this.balance,
      this.frozen,
      this.active,
      this.accountingCurrency,
      this.customerId,
      this.accountNumber,
      this.xpub});

  factory CreateVirtualCurrencyResponse.fromJson(Map<String, dynamic>? json) =>
      _$CreateVirtualCurrencyResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$CreateVirtualCurrencyResponseToJson(this);
}
