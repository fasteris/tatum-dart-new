// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateBCashWalletResponse _$GenerateBCashWalletResponseFromJson(
        Map<String, dynamic> json) =>
    GenerateBCashWalletResponse(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateBCashWalletResponseToJson(
        GenerateBCashWalletResponse instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
