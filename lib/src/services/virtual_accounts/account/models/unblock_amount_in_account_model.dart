import 'package:equatable/equatable.dart';

class UnBlockAmountInAnAccount extends Equatable {
  final String recipientAccountId;
  final String amount;
  final bool? anonymous;
  final bool? compliant;
  final String? transactionCode;
  final String? paymentId;
  final String? recipientNote;
  final int? baseRate;
  final String? senderNote;

  const UnBlockAmountInAnAccount(
      {required this.amount,
      required this.recipientAccountId,
      this.anonymous,
      this.baseRate,
      this.compliant,
      this.paymentId,
      this.recipientNote,
      this.senderNote,
      this.transactionCode});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'compliant': compliant,
        'paymentId': paymentId,
        'baseRate': baseRate,
        'recipientNote': recipientNote,
        'senderNote': senderNote,
        'transactionCode': transactionCode,
        'anonymous': anonymous,
        'recipientAccountId': recipientAccountId
      };

  @override
  List<Object?> get props => [
        amount,
        compliant,
        paymentId,
        baseRate,
        recipientAccountId,
        recipientNote,
        senderNote,
        transactionCode,
        anonymous
      ];
}
