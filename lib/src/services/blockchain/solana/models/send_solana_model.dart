import 'package:equatable/equatable.dart';


class SendSOLModel extends Equatable {
  final String to;
  final String currency;
  final String amount;
  final String fromPrivateKey;
  final String? feePayer;
  final int? feePayerPrivateKey;

  const SendSOLModel(
      {required this.amount,
      required this.currency,
      required this.fromPrivateKey,
      required this.to,
      this.feePayer,
      this.feePayerPrivateKey});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'currency': currency,
        'to': to,
        'feePayer': feePayer,
        'feePayerPrivateKey': feePayerPrivateKey
      };

  @override
  List<Object?> get props =>
      [fromPrivateKey, currency, amount, to, feePayerPrivateKey, feePayer];
}
