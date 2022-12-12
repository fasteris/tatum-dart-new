// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_algorand_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateAlgorandWalletResponse _$GenerateAlgorandWalletResponseFromJson(
        Map<String, dynamic> json) =>
    GenerateAlgorandWalletResponse(
      address: json['address'] as String,
      secret: json['secret'] as String,
    );

Map<String, dynamic> _$GenerateAlgorandWalletResponseToJson(
        GenerateAlgorandWalletResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'secret': instance.secret,
    };
