// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_dogecoin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateDogecoinWallet _$GenerateDogecoinWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateDogecoinWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateDogecoinWalletToJson(
        GenerateDogecoinWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
