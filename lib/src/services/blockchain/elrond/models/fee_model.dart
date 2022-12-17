import 'package:equatable/equatable.dart';


class FeeModel extends Equatable {
  final String? gasLimit;
  final String? gasPrice;
  const FeeModel({this.gasLimit, this.gasPrice});

  Map<String, dynamic> toJson() => {'gasLimit': gasLimit, 'gasPrice': gasLimit};

  @override
  List<Object?> get props => [gasLimit, gasPrice];
}
