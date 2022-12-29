import 'package:equatable/equatable.dart';

class SendPaymentBatchModel extends Equatable {
  final String senderAccountId;

  const SendPaymentBatchModel({required this.senderAccountId});

  Map<String, dynamic> toJson() => {'senderAccountId': senderAccountId};

  @override
  List<Object?> get props => [senderAccountId];
}
