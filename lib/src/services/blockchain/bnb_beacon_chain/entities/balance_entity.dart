import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';

part 'balance_entity.g.dart';

@JsonSerializable()
class BalanceEntity {
  final String fee;
  final String frozen;
  final String locked;
  final String symbol;

  BalanceEntity(
      {required this.fee,
      required this.frozen,
      required this.locked,
      required this.symbol});

  factory BalanceEntity.fromJson(Map<String, dynamic>? json) =>
      _$BalanceEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$BalanceEntityToJson(this);
}
