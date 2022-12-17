// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_stellar_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateStellarWallet _$GenerateStellarWalletFromJson(
        Map<String, dynamic> json) =>
    GenerateStellarWallet(
      address: json['address'] as String?,
      secret: json['secret'] as String?,
    );

Map<String, dynamic> _$GenerateStellarWalletToJson(
        GenerateStellarWallet instance) =>
    <String, dynamic>{
      'address': instance.address,
      'secret': instance.secret,
    };
