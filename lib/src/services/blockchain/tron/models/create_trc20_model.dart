import 'package:equatable/equatable.dart';

class CreateTRC20Model extends Equatable {
  final String fromPrivateKey;
  final String recipient;
  final String name;
  final String symbol;
  final int totalSupply;
  final int decimals;

  const CreateTRC20Model({
    required this.fromPrivateKey,
    required this.recipient,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.totalSupply,
  });

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'recipient': recipient,
        'name': name,
        'symbol': symbol,
        'totalSupply': totalSupply,
        'decimals': decimals
      };

  @override
  List<Object?> get props => [
        fromPrivateKey,
        recipient,
        name,
        symbol,
        totalSupply,
        decimals
      ];
}
