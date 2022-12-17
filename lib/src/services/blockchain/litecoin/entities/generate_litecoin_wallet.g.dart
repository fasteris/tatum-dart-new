// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_litecoin_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateLitecoinWallet _$GenerateLitecoinWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateLitecoinWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateLitecoinWalletToJson(
        GenerateLitecoinWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
