import 'package:equatable/equatable.dart';

class SendPaymentModel extends Equatable {
  final String senderAccountId;
  final String recipientAccountId;
  final String amount;
  final bool? anonymous;
  final bool? compliant;
  final String? transactionCode;
  final String? paymentId;
  final String? recipientNote;
  final int? baseRate;
  final String? senderNote;

  const SendPaymentModel(
      {required this.senderAccountId,
      required this.recipientAccountId,
      required this.amount,
      this.anonymous,
      this.baseRate,
      this.compliant,
      this.paymentId,
      this.recipientNote,
      this.senderNote,
      this.transactionCode});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'senderAccountId': senderAccountId,
        'recipientAccountId': recipientAccountId,
        'anonymous': anonymous,
        'compliant': compliant,
        'transactionCode': transactionCode,
        'paymentId': paymentId,
        'recipientNote': recipientNote,
        'senderNote': senderNote,
        'baseRate': baseRate
      };

  @override
  List<Object?> get props => [
        amount,
        senderAccountId,
        recipientAccountId,
        anonymous,
        compliant,
        transactionCode,
        paymentId,
        recipientNote,
        senderNote,
        baseRate
      ];
}
