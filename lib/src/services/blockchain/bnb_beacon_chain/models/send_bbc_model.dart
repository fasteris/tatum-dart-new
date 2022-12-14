import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class SendBBCModel extends Equatable {
  final String to;
  final String currency;
  final String amount;
  final String fromPrivateKey;
  final String? message;

  const SendBBCModel(
      {required this.amount,
      required this.currency,
      required this.fromPrivateKey,
      required this.to,
      this.message});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'currency': currency,
        'to': to,
        'message': message
      };

  @override
  List<Object?> get props =>
      [fromPrivateKey, currency, amount, to, message];
}
