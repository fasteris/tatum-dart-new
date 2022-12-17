// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_kucoin_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateKuCoinWallet _$GenerateKuCoinWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateKuCoinWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateKuCoinWalletToJson(
        GenerateKuCoinWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
