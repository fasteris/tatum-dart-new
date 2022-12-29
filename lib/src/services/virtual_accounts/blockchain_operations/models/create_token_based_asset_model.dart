import 'package:equatable/equatable.dart';

class CreateTokenBasedAssetModel extends Equatable {
  final String issuerAccount;
  final String token;
  final String basePair;

  const CreateTokenBasedAssetModel(
      {required this.issuerAccount,
      required this.basePair,
      required this.token});

  Map<String, dynamic> toJson() =>
      {'issuerAccount': issuerAccount, 'token': token, 'basePair': basePair};

  @override
  List<Object?> get props => [issuerAccount, token, basePair];
}
