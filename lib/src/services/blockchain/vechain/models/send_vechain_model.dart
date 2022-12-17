import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/elrond/models/fee_model.dart';

class SendVeChainModel extends Equatable {
  final String to;
  final String amount;
  final String fromPrivateKey;
  final String? data;
  final FeeModel? fee;

  const SendVeChainModel(
      {required this.amount,
      required this.fromPrivateKey,
      required this.to,
      this.data,
      this.fee});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'to': to,
        'fee': fee,
        'data': data
      };

  @override
  List<Object?> get props =>
      [fromPrivateKey, amount, to, data, fee];
}
