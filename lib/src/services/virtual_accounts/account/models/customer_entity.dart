import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  final String? accountCurrency;
  final String? customerCountry;
  final String externalId;
  final String? providerCountry;

  const CustomerModel(
      {this.accountCurrency,
      this.customerCountry,
      required this.externalId,
      this.providerCountry});

  Map<String, dynamic> toJson() => {
        'accountCurrency': accountCurrency,
        'customerCountry': customerCountry,
        'externalId': externalId,
        'providerCountry': providerCountry
      };

  @override
  List<Object?> get props =>
      [accountCurrency, customerCountry, externalId, providerCountry];
}
