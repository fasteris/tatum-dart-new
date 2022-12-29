import 'package:equatable/equatable.dart';

class UpdateCustomerModel extends Equatable {
  final String externalId;
  final String? accountingCurrency;
  final String? customerCountry;
  final String? providerCountry;

  const UpdateCustomerModel(
      {required this.externalId,
      this.accountingCurrency,
      this.customerCountry,
      this.providerCountry});

  Map<String, dynamic> toJson() => {
        'externalId': externalId,
        'accountingCurrency': accountingCurrency,
        'customerCountry': customerCountry,
        'providerCountry': providerCountry
      };

  @override
  List<Object?> get props =>
      [externalId, accountingCurrency, customerCountry, providerCountry];
}
