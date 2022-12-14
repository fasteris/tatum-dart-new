// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_flow_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateFlowWallet _$GenerateFlowWalletFromJson(Map<String, dynamic> json) =>
    GenerateFlowWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateFlowWalletToJson(GenerateFlowWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
