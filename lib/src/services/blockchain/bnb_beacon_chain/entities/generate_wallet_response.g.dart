// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateBBCWallet _$GenerateBBCWalletFromJson(Map<String, dynamic> json) =>
    GenerateBBCWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateBBCWalletToJson(GenerateBBCWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
