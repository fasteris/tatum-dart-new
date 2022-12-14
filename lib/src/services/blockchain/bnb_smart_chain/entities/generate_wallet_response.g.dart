// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateBSCWallet _$GenerateBSCWalletFromJson(Map<String, dynamic> json) =>
    GenerateBSCWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateBSCWalletToJson(GenerateBSCWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
