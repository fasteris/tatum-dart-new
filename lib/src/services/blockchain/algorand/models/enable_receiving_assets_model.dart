import 'package:equatable/equatable.dart';

class EnableReceivingAssetsModel extends Equatable {
  final String assetId;
  final String fromPrivateKey;

  const EnableReceivingAssetsModel({required this.assetId, required this.fromPrivateKey});

  Map<String, dynamic> toJson() =>
      {'from': assetId, 'fromPrivateKey': fromPrivateKey};

  @override
  List<Object?> get props => [assetId, fromPrivateKey];
}
