import 'package:equatable/equatable.dart';

class FindTxForAccountModel extends Equatable {
  final String id;
  final String? counterAccount;
  final int? from;
  final String? currency;
  final dynamic amount;
  final dynamic currencies;
  final dynamic transactionType;
  final dynamic transactionTypes;
  final String? opType;
  final String? transactionCode;
  final String? paymentId;
  final String? recipientNote;
  final String? senderNote;
  final int? to;

  const FindTxForAccountModel(
      {required this.id,
      this.counterAccount,
      this.from,
      this.currencies,
      this.currency,
      this.amount,
      this.transactionCode,
      this.transactionType,
      this.transactionTypes,
      this.paymentId,
      this.recipientNote,
      this.opType,
      this.senderNote,
      this.to});

  Map<String, dynamic> toJson() => {
        'id': id,
        'counterAccount': counterAccount,
        'from': from,
        'currencies': currencies,
        'currency': currency,
        'amount': amount,
        'transactionCode': transactionCode,
        'transactionType': transactionType,
        'transactionTypes': transactionTypes,
        'paymentId': paymentId,
        'recipientNote': recipientNote,
        'opType': opType,
        'senderNote': senderNote,
        'to': to
      };

  @override
  List<Object?> get props => [
        id,
        counterAccount,
        from,
        currencies,
        currency,
        amount,
        transactionCode,
        transactionType,
        transactionTypes,
        paymentId,
        recipientNote,
        opType,
        senderNote,
        to
      ];
}
