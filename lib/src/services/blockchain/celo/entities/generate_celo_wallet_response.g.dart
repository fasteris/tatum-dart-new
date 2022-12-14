// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_celo_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateCeloWallet _$GenerateCeloWalletFromJson(Map<String, dynamic> json) =>
    GenerateCeloWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateCeloWalletToJson(GenerateCeloWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
