import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/elrond/models/fee_model.dart';

class SendModel extends Equatable {
  final String to;
  final String currency;
  final String amount;
  final String fromPrivateKey;
  final String? data;
  final int? nonce;
  final FeeModel? fee;

  const SendModel(
      {required this.amount,
      required this.currency,
      required this.fromPrivateKey,
      required this.to,
      this.data,
      this.fee,
      this.nonce});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'currency': currency,
        'to': to,
        'fee': fee,
        'nonce': nonce,
        'data': data
      };

  @override
  List<Object?> get props =>
      [fromPrivateKey, currency, amount, to, data, nonce, fee];
}
