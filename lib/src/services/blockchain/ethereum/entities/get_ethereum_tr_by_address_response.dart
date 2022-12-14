import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'get_ethereum_tr_by_address_response.g.dart';

@JsonSerializable()
class GetEthereumTrByAddressResponse {
  final int? total;
  final List<TransactionEntity> tx;

  GetEthereumTrByAddressResponse({required this.tx, this.total});

  factory GetEthereumTrByAddressResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetEthereumTrByAddressResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetEthereumTrByAddressResponseToJson(this);
}
