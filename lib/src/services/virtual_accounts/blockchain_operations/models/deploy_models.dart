import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/customer_entity.dart';

class DeployTokenViaMnemonicAddress extends Equatable {
  final String symbol;
  final String supply;
  final String description;
  final String basePair;
  final int? baseRate;
  final CustomerModel? customer;
  final String address;
  final String mnemonic;
  final int index;
  final num? nonce;

  const DeployTokenViaMnemonicAddress(
      {required this.supply,
      required this.symbol,
      required this.description,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.address,
      required this.mnemonic,
      required this.index,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'supply': supply,
        'symbol': symbol,
        'description': description,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'address': address,
        'mnemonic': mnemonic,
        'index': index,
        'nonce': nonce
      };

  @override
  List<Object?> get props => [
        supply,
        symbol,
        description,
        basePair,
        baseRate,
        customer,
        address,
        mnemonic,
        index,
        nonce
      ];
}

class DeployTokenViaMnemonicXPub extends Equatable {
  final String symbol;
  final String supply;
  final String description;
  final String basePair;
  final int? baseRate;
  final CustomerModel? customer;
  final String xpub;
  final int? derivationIndex;
  final String mnemonic;
  final int index;
  final num? nonce;

  const DeployTokenViaMnemonicXPub(
      {required this.supply,
      required this.symbol,
      required this.description,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.xpub,
      required this.derivationIndex,
      required this.mnemonic,
      required this.index,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'supply': supply,
        'symbol': symbol,
        'description': description,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'xpub': xpub,
        'derivationIndex': derivationIndex,
        'mnemonic': mnemonic,
        'index': index,
        'nonce': nonce
      };

  @override
  List<Object?> get props => [
        supply,
        symbol,
        description,
        basePair,
        baseRate,
        customer,
        xpub,
        derivationIndex,
        mnemonic,
        index,
        nonce
      ];
}

class DeployTokenViaPrivateKeyAddress extends Equatable {
  final String symbol;
  final String supply;
  final String description;
  final String basePair;
  final int? baseRate;
  final CustomerModel? customer;
  final String address;
  final String privateKey;
  final num? nonce;

  const DeployTokenViaPrivateKeyAddress(
      {required this.supply,
      required this.symbol,
      required this.description,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.address,
      required this.privateKey,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'supply': supply,
        'symbol': symbol,
        'description': description,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'address': address,
        'privateKey': privateKey,
        'nonce': nonce
      };

  @override
  List<Object?> get props => [
        supply,
        symbol,
        description,
        basePair,
        baseRate,
        customer,
        address,
        privateKey,
        nonce
      ];
}

class DeployTokenViaPrivateKeyXPub extends Equatable {
  final String symbol;
  final String supply;
  final String description;
  final String basePair;
  final int? baseRate;
  final CustomerModel? customer;
  final String xpub;
  final int derivationIndex;
  final String privateKey;
  final num? nonce;

  const DeployTokenViaPrivateKeyXPub(
      {required this.supply,
      required this.symbol,
      required this.description,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.xpub,
      required this.derivationIndex,
      required this.privateKey,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'supply': supply,
        'symbol': symbol,
        'description': description,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'derivationIndex': derivationIndex,
        'privateKey': privateKey,
        'xpub': xpub,
        'nonce': nonce
      };

  @override
  List<Object?> get props => [
        supply,
        symbol,
        description,
        basePair,
        baseRate,
        customer,
        privateKey,
        xpub,
        derivationIndex,
        nonce
      ];
}

class DeployTokenViaKMSAddress extends Equatable {
  final String symbol;
  final String supply;
  final String description;
  final String basePair;
  final int? baseRate;
  final CustomerModel? customer;
  final String address;
  final String signatureId;
  final num? nonce;

  const DeployTokenViaKMSAddress(
      {required this.supply,
      required this.symbol,
      required this.description,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.address,
      required this.signatureId,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'supply': supply,
        'symbol': symbol,
        'description': description,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'address': address,
        'signatureId': signatureId,
        'nonce': nonce
      };

  @override
  List<Object?> get props => [
        supply,
        symbol,
        description,
        basePair,
        baseRate,
        customer,
        address,
        signatureId,
        nonce
      ];
}


class DeployTokenViaKMSXPub extends Equatable {
  final String symbol;
  final String supply;
  final String description;
  final String basePair;
  final int? baseRate;
  final CustomerModel? customer;
  final String xpub;
  final String derivationIndex;
  final String signatureId;
  final num? nonce;

  const DeployTokenViaKMSXPub(
      {required this.supply,
      required this.symbol,
      required this.description,
      required this.basePair,
      this.baseRate,
      this.customer,
      required this.xpub,
      required this.derivationIndex,
      required this.signatureId,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'supply': supply,
        'symbol': symbol,
        'description': description,
        'basePair': basePair,
        'baseRate': baseRate,
        'customer': customer,
        'xpin': xpub,
        'derivationIndex': derivationIndex,
        'signatureId': signatureId,
        'nonce': nonce
      };

  @override
  List<Object?> get props => [
        supply,
        symbol,
        description,
        basePair,
        baseRate,
        customer,
        xpub,
        derivationIndex,
        signatureId,
        nonce
      ];
}
