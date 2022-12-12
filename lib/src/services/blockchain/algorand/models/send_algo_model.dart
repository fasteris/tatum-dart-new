import 'package:equatable/equatable.dart';

class SendAlgosModel extends Equatable {
  final String from;
  final String to;
  final String fee;
  final String amount;
  final String fromPrivateKey;

  const SendAlgosModel(
      {required this.fee,
      required this.from,
      required this.amount,
      required this.fromPrivateKey,
      required this.to});

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'fee': fee,
        'amount': amount,
        'fromPrivateKey': fromPrivateKey
      };

  @override
  List<Object?> get props => [from, to, fee, amount, fromPrivateKey];
}
