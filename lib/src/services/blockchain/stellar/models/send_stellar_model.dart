import 'package:equatable/equatable.dart';

class SendXLMModel extends Equatable {
  final String to;
  final String amount;
  final String fromAccount;
  final String fromSecret;
  final bool? initialize;
  final String? message;

  const SendXLMModel(
      {required this.amount,
      required this.fromAccount,
      required this.to,
      required this.fromSecret,
      this.initialize,
      this.message});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'to': to,
        'fromAccount': fromAccount,
        'fromSecret': fromSecret,
        'initialize': initialize,
        'message': message
      };

  @override
  List<Object?> get props =>
      [amount, to, fromAccount, fromSecret, initialize, message];
}
