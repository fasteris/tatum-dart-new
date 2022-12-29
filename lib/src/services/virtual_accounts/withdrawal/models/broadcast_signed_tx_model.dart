import 'package:equatable/equatable.dart';

class BroadcastSignedTxModel extends Equatable {
  final String txData;
  final String currency;
  final String withdrawalId;
  final String signatureId;

  const BroadcastSignedTxModel(
      {required this.txData,
      required this.currency,
      required this.signatureId,
      required this.withdrawalId});

  Map<String, dynamic> toJson() => {
        'txData': txData,
        'currency': currency,
        'withdrawalId': withdrawalId,
        'signatureId': signatureId
      };

  @override
  List<Object?> get props => [txData, currency, withdrawalId, signatureId];
}
