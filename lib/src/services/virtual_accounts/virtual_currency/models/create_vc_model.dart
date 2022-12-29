import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/virtual_accounts/customer/entities/customer_entity.dart';

class CreateNewVCModel extends Equatable {
  final String name;
  final String supply;
  final String basePair;
  final int? baseRate;
  final CustomerEntity? customer;
  final String? description;
  final String? accountCode;
  final String? accountingCurrency;

  const CreateNewVCModel(
      {required this.name,
      required this.supply,
      required this.basePair,
      this.baseRate,
      this.customer,
      this.description,
      this.accountCode,
      this.accountingCurrency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'supply': supply,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'description': description,
        'accountCode': accountCode,
        'accountingCurrency': accountingCurrency
      };

  @override
  List<Object?> get props => [
        name,
        supply,
        basePair,
        baseRate,
        customer,
        description,
        accountCode,
        accountingCurrency
      ];
}
