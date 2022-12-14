import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_binance_tx_by_address_response.g.dart';

@JsonSerializable()
class GetBinanceTxByAddressResponse {
  final int? total;
  final List<TransactionEntity> tx;

  GetBinanceTxByAddressResponse(
      {required this.tx, this.total});

  factory GetBinanceTxByAddressResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBinanceTxByAddressResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetBinanceTxByAddressResponseToJson(this);
}
