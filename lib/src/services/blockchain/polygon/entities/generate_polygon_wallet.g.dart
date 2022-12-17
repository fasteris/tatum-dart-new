// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_polygon_wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePolygonWallet _$GeneratePolygonWalletFromJson(
        Map<String, dynamic> json) =>
    GeneratePolygonWallet(
      mnemonic: json['mnemonic'] as String,
      xpub: json['xpub'] as String,
    );

Map<String, dynamic> _$GeneratePolygonWalletToJson(
        GeneratePolygonWallet instance) =>
    <String, dynamic>{
      'mnemonic': instance.mnemonic,
      'xpub': instance.xpub,
    };
