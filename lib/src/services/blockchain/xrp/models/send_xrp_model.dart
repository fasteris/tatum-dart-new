import 'package:equatable/equatable.dart';

class SendXRPModel extends Equatable {
  final String to;
  final String amount;
  final String fromAccount;
  final String fromSecret;
  final String? fee;
  final int? sourceTag;
  final int? destinationTag;

  const SendXRPModel(
      {required this.amount,
      required this.fromAccount,
      required this.to,
      required this.fromSecret,
      this.fee,
      this.sourceTag,
      this.destinationTag});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'to': to,
        'fromAccount': fromAccount,
        'fromSecret': fromSecret,
        'fee': fee,
        'sourceTag': sourceTag,
        'destinationTag': destinationTag
      };

  @override
  List<Object?> get props =>
      [amount, to, fromAccount, fromSecret, fee, sourceTag, destinationTag];
}
