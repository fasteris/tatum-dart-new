import 'package:equatable/equatable.dart';

class StoreWithdrawalModel extends Equatable {
  final String senderAccountId;
  final String address;
  final String amount;
  final bool? compliant;
  final String fee;
  final List<String>? multipleAccounts;
  final String? attr;
  final String? paymentId;
  final String? senderNote;

  const StoreWithdrawalModel(
      {required this.senderAccountId,
      required this.address,
      required this.amount,
      this.compliant,
      required this.fee,
      this.multipleAccounts,
      this.attr,
      this.paymentId,
      this.senderNote});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'senderAccountId': senderAccountId,
        'address': address,
        'compliant': compliant,
        'fee': fee,
        'multipleAccounts': multipleAccounts,
        'paymentId': paymentId,
        'attr': attr,
        'senderNote': senderNote
      };

  @override
  List<Object?> get props => [
        amount,
        senderAccountId,
        address,
        compliant,
        fee,
        multipleAccounts,
        paymentId,
        attr,
        senderNote
      ];
}

