import 'package:json_annotation/json_annotation.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/logs_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'internal_transaction_entity.g.dart';

@JsonSerializable()
class InternalTransactionEntity {
  final String? from;
  final String? to;
  final String? value;
  final int? blockNumber;
  final String? timeStamp;
  final String? hash;
  final String? input;
  final String? traceId;
  final String? type;
  final String? errCode;
  final int? gas;
  final String? isError;
  final int? gasUsed;
  final String? contractAddress;

  InternalTransactionEntity(
      {this.value,
      this.blockNumber,
      this.contractAddress,
      this.errCode,
      this.from,
      this.gas,
      this.gasUsed,
      this.hash,
      this.input,
      this.isError,
      this.timeStamp,
      this.to,
      this.traceId,
      this.type});

  factory InternalTransactionEntity.fromJson(Map<String, dynamic>? json) =>
      _$InternalTransactionEntityFromJson(json!);

  Map<String, dynamic> toJson() => _$InternalTransactionEntityToJson(this);
}
