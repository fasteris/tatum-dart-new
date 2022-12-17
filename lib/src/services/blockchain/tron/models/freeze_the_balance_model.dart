import 'package:equatable/equatable.dart';

class FreezeBalanceModel extends Equatable {
  final int duration;
  final String receiver;
  final String fromPrivateKey;
  final String amount;
  final String resource;

  const FreezeBalanceModel({
    required this.duration,
    required this.receiver,
    required this.fromPrivateKey,
    required this.amount,
    required this.resource,
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'receiver': receiver,
        'duration': duration,
        'fromPrivateKey': fromPrivateKey,
        'resource': resource
      };

  @override
  List<Object?> get props =>
      [amount, fromPrivateKey, receiver, duration, resource];
}
