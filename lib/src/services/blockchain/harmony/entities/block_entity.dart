import 'package:json_annotation/json_annotation.dart';

part 'block_entity.g.dart';

@JsonSerializable()
class BlockEntity {
  final int shardID;
  final int blockNumber;

  BlockEntity({required this.shardID, required this.blockNumber});

  factory BlockEntity.fromJson(Map<String, dynamic>? json) =>
      _$BlockEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$BlockEntityToJson(this);
}
