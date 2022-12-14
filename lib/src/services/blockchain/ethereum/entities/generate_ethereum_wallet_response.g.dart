// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_ethereum_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateEthereumWallet _$GenerateEthereumWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateEthereumWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateEthereumWalletToJson(
        GenerateEthereumWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
