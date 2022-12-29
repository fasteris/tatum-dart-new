// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_bc_addresses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBlkChainAddressesResponse _$CreateBlkChainAddressesResponseFromJson(
        Map<String, dynamic> json) =>
    CreateBlkChainAddressesResponse(
      address: json['address'] as String?,
      currency: json['currency'] as String?,
      derivationKey: json['derivationKey'] as int?,
      destinationTag: json['destinationTag'] as int?,
      memo: json['memo'] as String?,
      message: json['message'] as String?,
      xpub: json['xpub'] as String?,
    );

Map<String, dynamic> _$CreateBlkChainAddressesResponseToJson(
        CreateBlkChainAddressesResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'currency': instance.currency,
      'derivationKey': instance.derivationKey,
      'xpub': instance.xpub,
      'destinationTag': instance.destinationTag,
      'memo': instance.memo,
      'message': instance.message,
    };
