import 'package:equatable/equatable.dart';

class BlockAmountInAnAccount extends Equatable {
  final String amount;
  final String type;
  final String? description;

  const BlockAmountInAnAccount(
      {required this.amount, required this.type, this.description});

  Map<String, dynamic> toJson() =>
      {'amount': amount, 'type': type, 'description': description};

  @override
  List<Object?> get props => [amount, type, description];
}
