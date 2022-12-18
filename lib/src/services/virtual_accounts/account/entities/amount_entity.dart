import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/balance_entity.dart';

part 'amount_entity.g.dart';

@JsonSerializable()
class AmountEntity {
  final String? id;
  final String? accountId;
  final String? amount;
  final String? type;
  final String? description;

  AmountEntity(
      {this.id, this.accountId, this.amount, this.description, this.type});

  factory AmountEntity.fromJson(Map<String, dynamic>? json) =>
      _$AmountEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$AmountEntityToJson(this);
}
