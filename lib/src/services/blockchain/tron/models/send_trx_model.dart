import 'package:equatable/equatable.dart';

class SendTRXModel extends Equatable {
  final String fromPrivateKey;
  final String amount;
  final String to;

  const SendTRXModel({
    required this.fromPrivateKey,
    required this.amount,
    required this.to,
  });

  Map<String, dynamic> toJson() =>
      {'amount': amount, 'fromPrivateKey': fromPrivateKey, 'to': to};

  @override
  List<Object?> get props => [amount, fromPrivateKey, to];
}
