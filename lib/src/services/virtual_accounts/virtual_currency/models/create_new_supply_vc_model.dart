import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/virtual_accounts/customer/entities/customer_entity.dart';

class CreateNewSupplyVCModel extends Equatable {
  final String accountId;
  final String amount;
  final String? paymentId;
  final String? reference;
  final String? transactionCode;
  final String? recipientNote;
  final String? counterAccount;
  final String? senderNote;

  const CreateNewSupplyVCModel(
      {required this.accountId,
      required this.amount,
      required this.paymentId,
      this.reference,
      this.recipientNote,
      this.counterAccount,
      this.senderNote,
      this.transactionCode});

  Map<String, dynamic> toJson() => {
        'accountId': accountId,
        'amount': amount,
        'paymentId': paymentId,
        'reference': reference,
        'recipientNote': recipientNote,
        'counterAccount': counterAccount,
        'senderNote': senderNote,
        'transactionCode': transactionCode
      };

  @override
  List<Object?> get props => [
        accountId,
        amount,
        paymentId,
        reference,
        recipientNote,
        counterAccount,
        senderNote,
        transactionCode
      ];
}
