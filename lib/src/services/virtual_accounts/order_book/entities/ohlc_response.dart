import 'package:json_annotation/json_annotation.dart';

part 'ohlc_response.g.dart';

@JsonSerializable()
class OHLCResponse {
  final int? timestamp;
  final String? high;
  final String? low;
  final String? open;
  final String? close;
  final String? volume;

  OHLCResponse(
      {this.timestamp,
      this.close,
      this.high,
      this.low,
      this.open,
      this.volume});

  factory OHLCResponse.fromJson(Map<String, dynamic>? json) =>
      _$OHLCResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$OHLCResponseToJson(this);
}
