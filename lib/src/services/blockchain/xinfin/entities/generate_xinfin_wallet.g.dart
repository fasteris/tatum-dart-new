// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_xinfin_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateXinfinWallet _$GenerateXinfinWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateXinfinWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateXinfinWalletToJson(
        GenerateXinfinWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
