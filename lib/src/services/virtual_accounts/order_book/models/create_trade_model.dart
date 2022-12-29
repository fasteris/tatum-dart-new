import 'package:equatable/equatable.dart';

class CreateTradeModel extends Equatable {
  final String type;
  final String price;
  final String amount;
  final String pair;
  final String currency1AccountId;
  final String currency2AccountId;
  final Attrbute? attr;

  const CreateTradeModel(
      {required this.amount,
      required this.type,
      required this.price,
      required this.pair,
      required this.currency1AccountId,
      required this.currency2AccountId,
      this.attr});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'type': type,
        'price': price,
        'pair': pair,
        'currency1AccountId': currency1AccountId,
        'currency2AccountId': currency2AccountId,
        'attr': attr
      };

  @override
  List<Object?> get props =>
      [amount, type, pair, price, currency1AccountId, currency2AccountId, attr];
}

class Attrbute {
  final int sealDate;
  const Attrbute({required this.sealDate});

  Map<String, dynamic> toJson() => {'sealDate': sealDate};
}
