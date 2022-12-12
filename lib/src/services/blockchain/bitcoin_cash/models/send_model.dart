import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/from_utxo.dart';

class SendModel extends Equatable {
  final List<FromUTXO> fromUTXO;
  final List<ToEntity> to;

  const SendModel({required this.fromUTXO, required this.to});

  Map<String, dynamic> toJson() => {'fromAddress': fromUTXO, 'to': to};

  @override
  List<Object?> get props => [fromUTXO, to];
}
