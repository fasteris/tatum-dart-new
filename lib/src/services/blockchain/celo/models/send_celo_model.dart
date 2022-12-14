import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class SendCeloModel extends Equatable {
  final String to;
  final String currency;
  final String feeCurrency;
  final String amount;
  final String fromPrivateKey;
  final String? data;
  final int? nonce;

  const SendCeloModel(
      {required this.amount,
      required this.currency,
      required this.fromPrivateKey,
      required this.to,
      required this.feeCurrency,
      this.data,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'currency': currency,
        'to': to,
        'feeCurrency': feeCurrency,
        'data': data,
        'nonce': nonce
      };

  @override
  List<Object?> get props =>
      [fromPrivateKey, currency, amount, to, feeCurrency, nonce, data];
}
