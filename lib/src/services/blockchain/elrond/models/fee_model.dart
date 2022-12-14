import 'package:equatable/equatable.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/from_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/to_entity.dart';

class FeeModel extends Equatable {
  final String gasLimit;
  final String gasPrice;
  const FeeModel({required this.gasLimit, required this.gasPrice});

  Map<String, dynamic> toJson() => {'gasLimit': gasLimit, 'gasPrice': gasLimit};

  @override
  List<Object?> get props => [gasLimit, gasPrice];
}
