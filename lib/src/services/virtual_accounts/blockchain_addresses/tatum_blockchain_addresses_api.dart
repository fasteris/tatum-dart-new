import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_addresses/entities/create_bc_addresses_response.dart';

part 'tatum_blockchain_addresses_api.g.dart';

abstract class VirtualBcAddressService {
  ///
  ///Create a deposit address associated with a virtual account.
  Future<CreateBlkChainAddressesResponse> createDepositAddress(
      {@Path('id') required String id, @Query('index') num? index});

  ///
  ///Get all deposit addresses generated for a virtual account.
  Future<List<CreateBlkChainAddressesResponse>>
      getAllDepositAccountForVirtualAccount({@Path('id') required String id});

  ///
  // ///Create multiple deposit addresses associated with a virtual account.
  // Future<List<CreateBlkChainAddressesResponse>>
  //     getAllDepositAccountForVirtualAccount({@Path('id') required String id});

  ///
  ///Check whether a blockchain address with the specified cryptocurrency is registered within Tatum and is assigned to a virtual account (that is, whether this blockchain address is a deposit address associated with the virtual account).
  Future<dynamic> checkBlockchainAddressAssignedToVirtualAccount(
      {@Path('currency') required String currency,
      @Path('address') required String address,
      @Query('index') required String index});

  ///
  ///Assign an existing blockchain address to a virtual account. The blockchain address becomes a deposit address associated with this account.
  Future<CreateBlkChainAddressesResponse>
      assignBlockchainAddressToVirtualAccount(
          {@Path('id') required String id,
          @Path('address') required String address,
          @Query('index') required num index});

  ///
  ///Remove a deposit address from the virtual account.
  Future<dynamic> removeDepositAddressFromVirtualAccount(
      {@Path('id') required String id,
      @Path('address') required String address,
      @Query('index') required num index});
}

@Singleton(as: VirtualBcAddressService)
@RestApi()
abstract class BlockchainAddressesAPI implements VirtualBcAddressService {
  @factoryMethod
  factory BlockchainAddressesAPI(Dio dio) = _BlockchainAddressesAPI;

  @override
  @POST('offchain/account/{id}/address')
  Future<CreateBlkChainAddressesResponse> createDepositAddress(
      {@Path('id') required String id, @Query('index') num? index});

  @override
  @GET('offchain/account/{id}/address')
  Future<List<CreateBlkChainAddressesResponse>>
      getAllDepositAccountForVirtualAccount({@Path('id') required String id});

  @override
  @GET('offchain/account/address/{address}/{currency}')
  Future<dynamic> checkBlockchainAddressAssignedToVirtualAccount(
      {@Path('currency') required String currency,
      @Path('address') required String address,
      @Query('index') required String index});

  @override
  @POST('offchain/account/{id}/address/{address}')
  Future<CreateBlkChainAddressesResponse>
      assignBlockchainAddressToVirtualAccount(
          {@Path('id') required String id,
          @Path('address') required String address,
          @Query('index') required num index});

  @override
  @DELETE('offchain/account/{id}/address/{address}')
  Future<dynamic> removeDepositAddressFromVirtualAccount(
      {@Path('id') required String id,
      @Path('address') required String address,
      @Query('index') required num index});
}
