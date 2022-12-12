import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class SendModel extends Equatable {
  final String to;
  final String currency;
  final String amount;
  final String fromPrivateKey;

  const SendModel(
      {required this.amount,
      required this.currency,
      required this.fromPrivateKey,
      required this.to});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'currency': currency,
        'to': to
      };

  @override
  List<Object?> get props => [fromPrivateKey, currency, amount, to];
}
