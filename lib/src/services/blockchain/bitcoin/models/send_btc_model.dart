import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class SendBTCModel extends Equatable {
  final List<FromEntity> fromAddress;
  final List<ToEntity> to;

  const SendBTCModel({required this.fromAddress, required this.to});

  Map<String, dynamic> toJson() => {'fromAddress': fromAddress, 'to': to};

  @override
  List<Object?> get props => [fromAddress, to];
}
