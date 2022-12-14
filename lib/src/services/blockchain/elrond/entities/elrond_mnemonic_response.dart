import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'elrond_mnemonic_response.g.dart';

@JsonSerializable()
class ElrondMnemonicResponse {
  final String mnemonic;

  ElrondMnemonicResponse(
      {required this.mnemonic});

  factory ElrondMnemonicResponse.fromJson(Map<String, dynamic>? json) =>
      _$ElrondMnemonicResponseFromJson(json!);

  Map<String, dynamic> toJson() => _$ElrondMnemonicResponseToJson(this);
}
