// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vechain_block_by_hash_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVeChainBlockByHashResponse _$GetVeChainBlockByHashResponseFromJson(
        Map<String, dynamic> json) =>
    GetVeChainBlockByHashResponse(
      gasLimit: (json['gasLimit'] as num?)?.toInt(),
      gasUsed: (json['gasUsed'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      parentID: json['parentID'] as String?,
      receiptsRoot: json['receiptsRoot'] as String?,
      size: (json['size'] as num?)?.toInt(),
      stateRoot: json['stateRoot'] as String?,
      timeStamp: (json['timeStamp'] as num?)?.toInt(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      beneficiary: json['beneficiary'] as String?,
      id: json['id'] as String?,
      signer: json['signer'] as String?,
      totalScore: (json['totalScore'] as num?)?.toInt(),
      txsFeatures: (json['txsFeatures'] as num?)?.toInt(),
      txsRoot: json['txsRoot'] as String?,
    );

Map<String, dynamic> _$GetVeChainBlockByHashResponseToJson(
        GetVeChainBlockByHashResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'beneficiary': instance.beneficiary,
      'gasLimit': instance.gasLimit,
      'gasUsed': instance.gasUsed,
      'totalScore': instance.totalScore,
      'number': instance.number,
      'parentID': instance.parentID,
      'size': instance.size,
      'timeStamp': instance.timeStamp,
      'transactions': instance.transactions,
      'txsRoot': instance.txsRoot,
      'txsFeatures': instance.txsFeatures,
      'stateRoot': instance.stateRoot,
      'receiptsRoot': instance.receiptsRoot,
      'signer': instance.signer,
    };
