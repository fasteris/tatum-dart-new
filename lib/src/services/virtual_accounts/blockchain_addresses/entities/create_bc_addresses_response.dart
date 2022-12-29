import 'package:json_annotation/json_annotation.dart';

part 'create_bc_addresses_response.g.dart';

@JsonSerializable()
class CreateBlkChainAddressesResponse {
  final String? address;
  final String? currency;
  final int? derivationKey;
  final String? xpub;
  final int? destinationTag;
  final String? memo;
  final String? message;

  CreateBlkChainAddressesResponse(
      {this.address,
      this.currency,
      this.derivationKey,
      this.destinationTag,
      this.memo,
      this.message,
      this.xpub});

  factory CreateBlkChainAddressesResponse.fromJson(
          Map<String, dynamic>? json) =>
      _$CreateBlkChainAddressesResponseFromJson(json!);

  Map<String, dynamic> toJson() =>
      _$CreateBlkChainAddressesResponseToJson(this);
}
