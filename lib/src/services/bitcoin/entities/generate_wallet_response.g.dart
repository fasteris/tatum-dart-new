// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateBitcoinWalletResponse _$GenerateBitcoinWalletResponseFromJson(
        Map<String, dynamic> json) =>
    GenerateBitcoinWalletResponse(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateBitcoinWalletResponseToJson(
        GenerateBitcoinWalletResponse instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
