import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/from_utxo.dart';

class SendDogecoinModel extends Equatable {
  final List<FromUTXO> fromUTXO;
  final List<ToEntity> to;
  final String? fee;
  final String? changeAddress;

  const SendDogecoinModel(
      {required this.fromUTXO, required this.to, this.fee, this.changeAddress});

  Map<String, dynamic> toJson() => {
        'fromAddress': fromUTXO,
        'to': to,
        'fee': fee,
        'changeAddress': changeAddress
      };

  @override
  List<Object?> get props => [fromUTXO, to, fee, changeAddress];
}
