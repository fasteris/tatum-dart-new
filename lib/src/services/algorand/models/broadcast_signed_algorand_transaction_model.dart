import 'package:equatable/equatable.dart';

class BroadcastSignedAlgorandTransaction extends Equatable {
  final String txData;

  const BroadcastSignedAlgorandTransaction({required this.txData});

  Map<String, dynamic> toJson() => {'txData': txData};

  @override
  List<Object?> get props => [txData];
}

class BroadcastModel extends Equatable {
  final String txData;

  const BroadcastModel({required this.txData});

  Map<String, dynamic> toJson() => {'txData': txData};

  @override
  List<Object?> get props => [txData];
}
