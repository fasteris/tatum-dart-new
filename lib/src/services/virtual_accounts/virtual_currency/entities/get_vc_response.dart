import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';

part 'get_vc_response.g.dart';

@JsonSerializable()
class GetVirtualCurrencyResponse {
  final String? name;
  final String? supply;
  final String? accountId;
  final int? baseRate;
  final int? precision;
  final String? trcType;
  final String? basePair;
  final String? customerId;
  final String? description;
  final String? xpub;
  final String? erc20Address;
  final String? issuerAccount;
  final String? chain;
  final String? initialAddress;

  GetVirtualCurrencyResponse(
      {this.name,
      this.accountId,
      this.basePair,
      this.baseRate,
      this.chain,
      this.customerId,
      this.description,
      this.erc20Address,
      this.initialAddress,
      this.issuerAccount,
      this.precision,
      this.supply,
      this.trcType,
      this.xpub});

  factory GetVirtualCurrencyResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetVirtualCurrencyResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetVirtualCurrencyResponseToJson(this);
}
