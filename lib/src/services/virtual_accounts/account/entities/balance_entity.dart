import 'package:equatable/equatable.dart';

class BalanceEntity extends Equatable {
  final String accountBalance;
  final String availableBalance;

  const BalanceEntity(
      {required this.accountBalance, required this.availableBalance});

  Map<String, dynamic> toJson() =>
      {'accountBalance': accountBalance, 'availableBalance': availableBalance};

  @override
  List<Object?> get props => [accountBalance, availableBalance];
}
