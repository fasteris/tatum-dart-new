import 'package:equatable/equatable.dart';

class CreateUpdateDeleteTrustlineModel extends Equatable {
  final String token;
  final String fromAccount;
  final String issuerAccount;
  final String fromSecret;
  final String? limit;
  final String? fee;

  const CreateUpdateDeleteTrustlineModel(
      {required this.issuerAccount,
      required this.fromAccount,
      required this.token,
      required this.fromSecret,
      this.limit,
      this.fee});

  Map<String, dynamic> toJson() => {
        'issuerAccount': issuerAccount,
        'token': token,
        'fromAccount': fromAccount,
        'fromSecret': fromSecret,
        'limit': limit,
        'fee': fee
      };

  @override
  List<Object?> get props =>
      [token, fromAccount, fromSecret, issuerAccount, limit, fee];
}
