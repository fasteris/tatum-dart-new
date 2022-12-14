import 'package:equatable/equatable.dart';

class BroadcastCeloModel extends Equatable {
  final String txData;
  final String? signatureId;

  const BroadcastCeloModel({required this.txData, this.signatureId});

  Map<String, dynamic> toJson() =>
      {'txData': txData, 'signatureId': signatureId};

  @override
  List<Object?> get props => [txData, signatureId];
}
