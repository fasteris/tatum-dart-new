import 'package:json_annotation/json_annotation.dart';

part 'get_hash_bitcoin_block_response.g.dart';

@JsonSerializable()
class GetHashBitcoinBlockResponse {
  final String hash;

  GetHashBitcoinBlockResponse({required this.hash});

  factory GetHashBitcoinBlockResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetHashBitcoinBlockResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$GetHashBitcoinBlockResponseToJson(this);
}
