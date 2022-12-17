import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class SendLitecoinModel extends Equatable {
  final List<FromEntity> fromAddress;
  final List<ToEntity> to;
  final String? fee;
  final String? changeAddress;

  const SendLitecoinModel(
      {required this.fromAddress,
      required this.to,
      this.changeAddress,
      this.fee});

  Map<String, dynamic> toJson() => {
        'fromAddress': fromAddress,
        'to': to,
        'fee': fee,
        'changeAddress': changeAddress
      };

  @override
  List<Object?> get props => [fromAddress, to, fee, changeAddress];
}
