import 'package:json_annotation/json_annotation.dart';

part 'txns_entity.g.dart';

@JsonSerializable()
class TXNSEntity {
  final int closeReward;
  final int closeAmount;
  final int confirmedRound;
  final int fee;
  final int firstValid;
  final String genesisHash;
  final String genesisId;
  final String id;
  final int intraRoundOffset;
  final int lastValid;
  final String note;
  final int receiverRewards;
  final int roundTime;
  final String sender;
  final int senderRewards;
  final String txType;

  TXNSEntity(
      {required this.closeAmount,
      required this.closeReward,
      required this.confirmedRound,
      required this.fee,
      required this.firstValid,
      required this.genesisHash,
      required this.genesisId,
      required this.id,
      required this.intraRoundOffset,
      required this.lastValid,
      required this.note,
      required this.receiverRewards,
      required this.roundTime,
      required this.sender,
      required this.senderRewards,
      required this.txType});

  factory TXNSEntity.fromJson(Map<String, dynamic>? json) =>
      _$TXNSEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$TXNSEntityToJson(this);
}
