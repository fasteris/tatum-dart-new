class CustomerModel {
  final String? accountingCurrency;
  final String? customerCountry;
  final String externalId;
  final String? providerCountry;

  const CustomerModel(
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
}
