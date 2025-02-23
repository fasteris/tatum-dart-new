// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txs_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TXSEntity _$TXSEntityFromJson(Map<String, dynamic> json) => TXSEntity(
      hash: json['hash'] as String,
      block: json['block'] as String,
      blockNumber: (json['blockNumber'] as num).toInt(),
      fee: (json['fee'] as num).toInt(),
      hex: json['hex'] as String,
      index: (json['index'] as num).toInt(),
      inputs: json['inputs'],
      locktime: (json['locktime'] as num).toInt(),
      mtime: (json['mtime'] as num).toInt(),
      outputs: json['outputs'],
      rate: (json['rate'] as num).toInt(),
      time: (json['time'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      witnessHash: json['witnessHash'] as String,
    );

Map<String, dynamic> _$TXSEntityToJson(TXSEntity instance) => <String, dynamic>{
      'hash': instance.hash,
      'hex': instance.hex,
      'witnessHash': instance.witnessHash,
      'fee': instance.fee,
      'rate': instance.rate,
      'mtime': instance.mtime,
      'blockNumber': instance.blockNumber,
      'block': instance.block,
      'time': instance.time,
      'index': instance.index,
      'version': instance.version,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
      'locktime': instance.locktime,
    };
