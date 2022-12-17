// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_one_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateONEWallet _$GenerateONEWalletFromJson(Map<String, dynamic> json) =>
    GenerateONEWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateONEWalletToJson(GenerateONEWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
