import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/blockchain/algorand/entities/asset_entity.dart';

part 'get_algorand_account_balance_response.g.dart';

@JsonSerializable()
class GetAlgorandAccountBalanceResponse {
  final List<AssetEntity> asset;
  final int balance;

  GetAlgorandAccountBalanceResponse({required this.asset, required this.balance});

  factory GetAlgorandAccountBalanceResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetAlgorandAccountBalanceResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetAlgorandAccountBalanceResponseToJson(this);
}
