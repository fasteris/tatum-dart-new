import 'package:json_annotation/json_annotation.dart';

part 'asset_entity.g.dart';

@JsonSerializable()
class AssetEntity {
  final int amount;
  final int assetIndex;

  AssetEntity({required this.amount, required this.assetIndex});

  factory AssetEntity.fromJson(
          Map<String, dynamic>? json) =>
      _$AssetEntityFromJson(json!);

  Map<String, dynamic> toJson() =>
      _$AssetEntityToJson(this);
}
