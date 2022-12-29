// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohlc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OHLCResponse _$OHLCResponseFromJson(Map<String, dynamic> json) => OHLCResponse(
      timestamp: json['timestamp'] as int?,
      close: json['close'] as String?,
      high: json['high'] as String?,
      low: json['low'] as String?,
      open: json['open'] as String?,
      volume: json['volume'] as String?,
    );

Map<String, dynamic> _$OHLCResponseToJson(OHLCResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
      'close': instance.close,
      'volume': instance.volume,
    };
