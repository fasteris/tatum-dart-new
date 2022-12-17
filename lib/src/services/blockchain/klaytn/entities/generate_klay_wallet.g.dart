// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_klay_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateKlayWallet _$GenerateKlayWalletFromJson(Map<String, dynamic> json) =>
    GenerateKlayWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GenerateKlayWalletToJson(GenerateKlayWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
