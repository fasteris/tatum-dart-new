import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/models/customer_model.dart';

class RegisterERC20Model extends Equatable {
  final String symbols;
  final String supply;
  final num decimals;
  final String description;
  final String xpub;
  final int derivationIndex;
  final String basePair;
  final num? baseRate;
  final CustomerModel? customer;
  final String? accountingCurrency;

  const RegisterERC20Model(
      {required this.symbols,
      required this.supply,
      required this.decimals,
      required this.xpub,
      this.accountingCurrency,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.derivationIndex,
      required this.description});

  Map<String, dynamic> toJson() => {
        'symbols': symbols,
        'supply': supply,
        'decimals': decimals,
        'accountingCurrency': accountingCurrency,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'derivationIndex': derivationIndex,
        'description': description,
        'xpub': xpub
      };

  @override
  List<Object?> get props => [
        symbols,
        supply,
        decimals,
        accountingCurrency,
        basePair,
        basePair,
        customer,
        derivationIndex,
        description,
        xpub
      ];
}

class RegisterERC20ViaAddressModel extends Equatable {
  final String symbols;
  final String supply;
  final num decimals;
  final String description;
  final String address;
  final String basePair;
  final num? baseRate;
  final CustomerModel? customer;
  final String? accountingCurrency;

  const RegisterERC20ViaAddressModel(
      {required this.symbols,
      required this.supply,
      required this.decimals,
      this.accountingCurrency,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.address,
      required this.description});

  Map<String, dynamic> toJson() => {
        'symbols': symbols,
        'supply': supply,
        'decimals': decimals,
        'accountingCurrency': accountingCurrency,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'address': address,
        'description': description
      };

  @override
  List<Object?> get props => [
        symbols,
        supply,
        decimals,
        accountingCurrency,
        basePair,
        basePair,
        customer,
        address,
        description
      ];
}

class RegisterTRC20ViaAddressModel extends Equatable {
  final String symbols;
  final String supply;
  final num decimals;
  final String type;
  final String url;
  final String description;
  final String address;
  final String basePair;
  final num? baseRate;
  final CustomerModel? customer;
  final String? accountingCurrency;

  const RegisterTRC20ViaAddressModel(
      {required this.symbols,
      required this.supply,
      required this.decimals,
      this.accountingCurrency,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.address,
      required this.description,
      required this.type,
      required this.url});

  Map<String, dynamic> toJson() => {
        'symbols': symbols,
        'supply': supply,
        'decimals': decimals,
        'accountingCurrency': accountingCurrency,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'address': address,
        'description': description,
        'url': url,
        'type': type
      };

  @override
  List<Object?> get props => [
        symbols,
        supply,
        decimals,
        accountingCurrency,
        basePair,
        baseRate,
        customer,
        address,
        description,
        url,
        type
      ];
}

class RegisterTRC20ViaXPubModel extends Equatable {
  final String symbols;
  final String supply;
  final num decimals;
  final String type;
  final String url;
  final String description;
  final String xpub;
  final String basePair;
  final num? baseRate;
  final CustomerModel? customer;
  final String? accountingCurrency;

  const RegisterTRC20ViaXPubModel(
      {required this.symbols,
      required this.supply,
      required this.decimals,
      this.accountingCurrency,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.xpub,
      required this.description,
      required this.type,
      required this.url});

  Map<String, dynamic> toJson() => {
        'symbols': symbols,
        'supply': supply,
        'decimals': decimals,
        'accountingCurrency': accountingCurrency,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'address': xpub,
        'description': description,
        'type': type,
        'url': url
      };

  @override
  List<Object?> get props => [
        symbols,
        supply,
        decimals,
        accountingCurrency,
        basePair,
        basePair,
        customer,
        xpub,
        description,
        url,
        type
      ];
}
