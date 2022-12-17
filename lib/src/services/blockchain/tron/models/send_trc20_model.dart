import 'package:equatable/equatable.dart';

class SendTRC20Model extends Equatable {
  final String fromPrivateKey;
  final String amount;
  final String to;
  final String tokenAddress;
  final int feeLimit;

  const SendTRC20Model(
      {required this.fromPrivateKey,
      required this.amount,
      required this.to,
      required this.tokenAddress,
      required this.feeLimit});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'fromPrivateKey': fromPrivateKey,
        'to': to,
        'tokenId': tokenAddress,
        'feeLimit': feeLimit
      };

  @override
  List<Object?> get props =>
      [amount, fromPrivateKey, to, tokenAddress, feeLimit];
}
