import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_balance_response.g.dart';

@JsonSerializable()
class GetBalanceResponse {
  final String balance;

  GetBalanceResponse({required this.balance});

  factory GetBalanceResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBalanceResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBalanceResponseToJson(this);
}
