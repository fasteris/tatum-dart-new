import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/customer_entity.dart';

class CreateAccountModel extends Equatable {
  final String currency;
  final String xpub;
  final CustomerModel? customer;
  final bool? compliant;
  final String? accountCode;
  final String? accountingCurrency;
  final String? accountNumber;

  const CreateAccountModel(
      {required this.currency,
      required this.xpub,
      this.accountCode,
      this.accountNumber,
      this.accountingCurrency,
      this.compliant,
      this.customer});

  Map<String, dynamic> toJson() => {
        'currency': currency,
        'xpub': xpub,
        'customer': customer,
        'compliant': compliant,
        'accountCode': accountCode,
        'accountingCurrency': accountingCurrency,
        'accountNumber': accountNumber
      };

  @override
  List<Object?> get props => [
        currency,
        xpub,
        customer,
        compliant,
        accountCode,
        accountingCurrency,
        accountNumber
      ];
}
