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
  final String? signatureId;

  const BroadcastModel({required this.txData, this.signatureId});

  Map<String, dynamic> toJson() =>
      {'txData': txData, 'signatureId': signatureId};

  @override
  List<Object?> get props => [txData, signatureId];
}
