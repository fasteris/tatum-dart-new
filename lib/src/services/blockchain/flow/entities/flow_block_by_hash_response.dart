import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'flow_block_by_hash_response.g.dart';

@JsonSerializable()
class FlowBlockByHashResponse {
  final String? id;
  final String? parentId;
  final int? height;
  final String? timestamp;
  final List<String>? transactions;
  final List<String>? signatures;
  final List<dynamic>? blockSeals;
  FlowBlockByHashResponse(
      {this.id,
      this.blockSeals,
      this.height,
      this.parentId,
      this.signatures,
      this.timestamp,
      this.transactions});

  factory FlowBlockByHashResponse.fromJson(Map<String, dynamic>? json) =>
      _$FlowBlockByHashResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$FlowBlockByHashResponseToJson(this);
}
