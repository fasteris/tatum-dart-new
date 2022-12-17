// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_solana_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateSolanaWallet _$GenerateSolanaWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateSolanaWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
      privateKey: json['privateKey'] as String?,
    );

Map<String, dynamic> _$GenerateSolanaWalletToJson(
        GenerateSolanaWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
      'privateKey': instance.privateKey,
    };
