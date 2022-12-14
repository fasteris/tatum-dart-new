import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class SendFlowModel extends Equatable {
  final String account;
  final String currency;
  final String? to;
  final String amount;
  final String mnemonic;
  final String index;

  const SendFlowModel(
      {required this.amount,
      required this.currency,
      required this.mnemonic,
      required this.account,
      required this.index,
      this.to});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'currency': currency,
        'to': to,
        'mnemonic': mnemonic,
        'account': account,
        'index': index
      };

  @override
  List<Object?> get props =>
      [index, currency, amount, to, mnemonic, account];
}
