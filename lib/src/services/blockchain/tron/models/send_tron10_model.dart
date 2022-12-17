import 'package:equatable/equatable.dart';

class SendTRC10Model extends Equatable {
  final String fromPrivateKey;
  final String amount;
  final String to;
  final String tokenId;

  const SendTRC10Model(
      {required this.fromPrivateKey,
      required this.amount,
      required this.to,
      required this.tokenId});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'fromPrivateKey': fromPrivateKey,
        'to': to,
        'tokenId': tokenId
      };

  @override
  List<Object?> get props => [amount, fromPrivateKey, to, tokenId];
}
