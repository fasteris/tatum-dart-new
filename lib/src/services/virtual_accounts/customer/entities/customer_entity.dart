import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';

part 'customer_entity.g.dart';

@JsonSerializable()
class CustomerEntity {
  final String? externalId;
  final String? id;
  final bool? enabled;
  final bool? active;
  final String? accountingCurrency;
  final String? customerCountry;
  final String? providerCountry;

  CustomerEntity(
      {this.id,
      this.externalId,
      this.enabled,
      this.active,
      this.accountingCurrency,
      this.customerCountry,
      this.providerCountry});

  factory CustomerEntity.fromJson(Map<String, dynamic>? json) =>
      _$CustomerEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$CustomerEntityToJson(this);
}
