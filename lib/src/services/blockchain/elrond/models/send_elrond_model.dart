import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/models/fee_model.dart';

class SendElrondModel extends Equatable {
  final String to;
  final String from;
  final String amount;
  final FeeModel? fee;
  final String? fromPrivateKey;
  final String? data;

  const SendElrondModel(
      {required this.amount,
      required this.to,
      required this.from,
      this.data,
      this.fee,
      this.fromPrivateKey});

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'amount': amount,
        'to': to,
        'fee': fee,
        'data': data,
        'from': from
      };

  @override
  List<Object?> get props => [fromPrivateKey, amount, to, fee, from, data];
}
