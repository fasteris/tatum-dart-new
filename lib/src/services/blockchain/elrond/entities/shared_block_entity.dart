import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'shared_block_entity.g.dart';

@JsonSerializable()
class SharedBlockEntity {
  final String hash;
  final int nonce;
  final int shard;

  SharedBlockEntity({required this.hash, required this.nonce, required this.shard});

  factory SharedBlockEntity.fromJson(Map<String, dynamic>? json) =>
      _$SharedBlockEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$SharedBlockEntityToJson(this);
}
