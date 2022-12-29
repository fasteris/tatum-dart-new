import 'package:equatable/equatable.dart';

class SendViaMnemonicModelVA extends Equatable {
  final String senderAccountId;
  final String address;
  final String amount;
  final String mnemonic;
  final String xpub;
  final int? index;

  const SendViaMnemonicModelVA(
      {required this.amount,
      required this.senderAccountId,
      required this.address,
      required this.mnemonic,
      required this.xpub,
      this.index});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'senderAccountId': senderAccountId,
        'address': address,
        'mnemonic': mnemonic,
        'xpub': xpub,
        'index': index
      };

  @override
  List<Object?> get props =>
      [amount, senderAccountId, address, mnemonic, index, xpub];
}

class SendViaKeyPairModelVA extends Equatable {
  final String senderAccountId;
  final String address;
  final String amount;
  final List keyPair;
  final String attr;

  const SendViaKeyPairModelVA(
      {required this.amount,
      required this.senderAccountId,
      required this.address,
      required this.keyPair,
      required this.attr});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'senderAccountId': senderAccountId,
        'address': address,
        'keyPair': keyPair,
        'attr': attr
      };

  @override
  List<Object?> get props => [amount, senderAccountId, address, keyPair, attr];
}

class SendViaKMSModelVA extends Equatable {
  final String senderAccountId;
  final String address;
  final String amount;
  final String signatureId;
  final String attr;

  const SendViaKMSModelVA(
      {required this.amount,
      required this.senderAccountId,
      required this.address,
      required this.signatureId,
      required this.attr});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'senderAccountId': senderAccountId,
        'address': address,
        'signatureId': signatureId,
        'attr': attr
      };

  @override
  List<Object?> get props =>
      [amount, senderAccountId, address, signatureId, attr];
}

class SendViaPrivateKeyModelVA extends Equatable {
  final String senderAccountId;
  final String address;
  final String amount;
  final String privateKey;
  final String attr;
  final String? fromPrivateKey;

  const SendViaPrivateKeyModelVA(
      {required this.amount,
      required this.senderAccountId,
      required this.address,
      required this.privateKey,
      required this.attr,
      this.fromPrivateKey});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'senderAccountId': senderAccountId,
        'address': address,
        'privateKey': privateKey,
        'attr': attr,
        'fromPrivateKey': fromPrivateKey
      };

  @override
  List<Object?> get props =>
      [amount, senderAccountId, address, privateKey, attr, fromPrivateKey];
}
