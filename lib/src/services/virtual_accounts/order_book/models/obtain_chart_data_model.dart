import 'package:equatable/equatable.dart';

class ObtainChartDataModel extends Equatable {
  ///
  /// [ 3 .. 30 ] characters ^[A-a-zZ0-9_\-]+\/[A-Za-z0-9_\-]+$
  final String pair;

  ///
  ///Start interval in UTC millis.
  final int from;

  ///
  ///End interval in UTC millis.
  final int to;

  ///
  ///Time frame of the chart.
  ///Enum: "MIN_1" "MIN_3" "MIN_5" "MIN_15" "MIN_30" "HOUR_1" "HOUR_4" "HOUR_12" "DAY" "WEEK" "MONTH" "YEAR"
  final String timeFrame;

  const ObtainChartDataModel(
      {required this.pair,
      required this.from,
      required this.to,
      required this.timeFrame});

  Map<String, dynamic> toJson() =>
      {'pair': pair, 'from': from, 'to': to, 'timeFrame': timeFrame};

  @override
  List<Object?> get props => [pair, from, to, timeFrame];
}
