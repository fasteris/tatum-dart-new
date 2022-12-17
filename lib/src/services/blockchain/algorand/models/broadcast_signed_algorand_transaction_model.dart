import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/solana/entities/options_entity.dart';

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
  final OptionsEntity? options;

  const BroadcastModel({required this.txData, this.signatureId, this.options});

  Map<String, dynamic> toJson() =>
      {'txData': txData, 'signatureId': signatureId, 'options': options};

  @override
  List<Object?> get props => [txData, signatureId, options];
}
