// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_vechain_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateVeChainWallet _$GenerateVeChainWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateVeChainWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateVeChainWalletToJson(
        GenerateVeChainWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
