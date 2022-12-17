import 'package:json_annotation/json_annotation.dart';

part 'current_tron_block_response.g.dart';

@JsonSerializable()
class CurrentTronBlock {
  final int? blockNumber;
  final String? hash;
  final bool? testnet;

  CurrentTronBlock({this.blockNumber, this.hash, this.testnet});

  factory CurrentTronBlock.fromJson(Map<String, dynamic>? json) =>
      _$CurrentTronBlockFromJson(json!);

  Map<String, dynamic> toJson() => _$CurrentTronBlockToJson(this);
}
