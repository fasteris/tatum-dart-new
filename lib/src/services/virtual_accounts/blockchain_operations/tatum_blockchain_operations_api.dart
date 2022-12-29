import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/entities/deploy_token_response.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/entities/operations_response.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/entities/register_token_response.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/models/create_token_based_asset_model.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/models/deploy_models.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/models/register_token_model.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/models/send_btc_model.dart';

part 'tatum_blockchain_operations_api.g.dart';

abstract class VirtualBcOperationsService {
  ///
  ///Send BTC (Bitcoin) from a virtual account to the blockchain. This will create Tatum internal withdrawal request with ID. If every system works as expected, withdrawal request is marked as complete and transaction id is assigned to it.
  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaMnemonic(
      {@Body() required SendViaMnemonicModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaKeyPair(
      {@Body() required SendViaKeyPairModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaKMS(
      {@Body() required SendViaKMSModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaPrivateKey(
      {@Body() required SendViaPrivateKeyModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  Future<OperationsResponse>
      sendErc20FromAVirtualAccountToBlockChainViaPrivateKey(
          {@Body() required SendViaPrivateKeyModelVA body});

  Future<OperationsResponse>
      sendErc20FromAVirtualAccountToBlockChainViaMnemonic(
          {@Body() required SendViaMnemonicModelVA body});

  Future<OperationsResponse> sendErc20FromAVirtualAccountToBlockChainViaKMS(
      {@Body() required SendViaKMSModelVA body});

  ///
  ///This is the first step to create a new ERC-20 or ERC-20 equivalent token with some supply in a virtual account.
  Future<RegisterTokenResponse> registerERC20ToVirtualAccount(
      {@Path('chain') required String chain,
      @Body() required RegisterERC20Model body});

  Future<RegisterTokenResponse> registerERC20ViaAddressToVirtualAccount(
      {@Path('chain') required String chain,
      @Body() required RegisterERC20ViaAddressModel body});

  ///
  ///Set the contract address of an ERC-20, ERC-20-equivalent or TRC-10 token (for example, BEP-20, HRM-20, and so on) to be able to communicate with the smart contract.
  Future<dynamic> setContractAddress(
      {@Path('address') required String address,
      @Path('name') required String name});

  //create token based asset
  Future<dynamic> createTokenBasedAsset(
      {@Body() required CreateTokenBasedAssetModel body,
      @Path('token') required String token});

  Future<RegisterTokenResponse> registerTronORTRC20ViaAddress(
      {@Body() required RegisterTRC20ViaAddressModel body});

  Future<RegisterTokenResponse> registerTronORTRC20ViaXPUB(
      {@Body() required RegisterTRC20ViaXPubModel body});

  /// deploy method
  ///erc20
  Future<DeployTokenResponse> deployERC20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployERC20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployERC20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployERC20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployERC20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployERC20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});

  ///bep
  Future<DeployTokenResponse> deployBEP20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployBEP20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployBEP20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployBEP20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployBEP20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployBEP20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});

  ///
  ///hrm
  Future<DeployTokenResponse> deployHRM20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployHRM20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployHRM20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployHRM20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployHRM20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployHRM20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});

  ///tron
  Future<DeployTokenResponse> deployTRC20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployTRC20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployTRC20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployTRC20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployTRC20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  Future<DeployTokenResponse> deployTRC20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});
}

@Singleton(as: VirtualBcOperationsService)
@RestApi()
abstract class BlockchainOperationsAPI implements VirtualBcOperationsService {
  @factoryMethod
  factory BlockchainOperationsAPI(Dio dio) = _BlockchainOperationsAPI;

  @override
  @POST('offchain/{coin}/transfer')
  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaMnemonic(
      {@Body() required SendViaMnemonicModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  @override
  @POST('offchain/{coin}/transfer')
  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaKeyPair(
      {@Body() required SendViaKeyPairModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  @override
  @POST('offchain/{coin}/transfer')
  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaKMS(
      {@Body() required SendViaKMSModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  @override
  @POST('offchain/{coin}/transfer')
  Future<OperationsResponse> sendFromAVirtualAccountToBlockChainViaPrivateKey(
      {@Body() required SendViaPrivateKeyModelVA body,
      @Path('coin') required String coin,
      @Query('shardID') int? shardID});

  @override
  @POST('offchain/ethereum/erc20/transfer')
  Future<OperationsResponse>
      sendErc20FromAVirtualAccountToBlockChainViaPrivateKey(
          {@Body() required SendViaPrivateKeyModelVA body});

  @override
  @POST('offchain/ethereum/erc20/transfer')
  Future<OperationsResponse>
      sendErc20FromAVirtualAccountToBlockChainViaMnemonic(
          {@Body() required SendViaMnemonicModelVA body});

  @override
  @POST('offchain/ethereum/erc20/transfer')
  Future<OperationsResponse> sendErc20FromAVirtualAccountToBlockChainViaKMS(
      {@Body() required SendViaKMSModelVA body});

  @override
  @POST('offchain/token/{chain}')
  Future<RegisterTokenResponse> registerERC20ToVirtualAccount(
      {@Path('chain') required String chain,
      @Body() required RegisterERC20Model body});

  @override
  @POST('offchain/token/{chain}')
  Future<RegisterTokenResponse> registerERC20ViaAddressToVirtualAccount(
      {@Path('chain') required String chain,
      @Body() required RegisterERC20ViaAddressModel body});

  @override
  @POST('offchain/token/{name}/{address}')
  Future<dynamic> setContractAddress(
      {@Path('address') required String address,
      @Path('name') required String name});

  @override
  @POST('offchain/{token}/asset')
  Future<dynamic> createTokenBasedAsset(
      {@Body() required CreateTokenBasedAssetModel body,
      @Path('token') required String token});

  @override
  @POST('offchain/tron/trc')
  Future<RegisterTokenResponse> registerTronORTRC20ViaAddress(
      {@Body() required RegisterTRC20ViaAddressModel body});

  @override
  @POST('offchain/tron/trc')
  Future<RegisterTokenResponse> registerTronORTRC20ViaXPUB(
      {@Body() required RegisterTRC20ViaXPubModel body});

  @override
  @POST('offchain/{token}/erc20/deploy')
  Future<DeployTokenResponse> deployERC20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/erc20/deploy')
  Future<DeployTokenResponse> deployERC20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/erc20/deploy')
  Future<DeployTokenResponse> deployERC20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/erc20/deploy')
  Future<DeployTokenResponse> deployERC20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/erc20/deploy')
  Future<DeployTokenResponse> deployERC20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/erc20/deploy')
  Future<DeployTokenResponse> deployERC20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/bep20/deploy')
  Future<DeployTokenResponse> deployBEP20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/bep20/deploy')
  Future<DeployTokenResponse> deployBEP20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/bep20/deploy')
  Future<DeployTokenResponse> deployBEP20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/bep20/deploy')
  Future<DeployTokenResponse> deployBEP20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/bep20/deploy')
  Future<DeployTokenResponse> deployBEP20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/bep20/deploy')
  Future<DeployTokenResponse> deployBEP20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/hrm20/deploy')
  Future<DeployTokenResponse> deployHRM20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/hrm20/deploy')
  Future<DeployTokenResponse> deployHRM20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/hrm20/deploy')
  Future<DeployTokenResponse> deployHRM20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/hrm20/deploy')
  Future<DeployTokenResponse> deployHRM20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/hrm20/deploy')
  Future<DeployTokenResponse> deployHRM20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/hrm20/deploy')
  Future<DeployTokenResponse> deployHRM20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/trc/deploy')
  Future<DeployTokenResponse> deployTRC20ViaMnemonicAddress(
      {@Body() required DeployTokenViaMnemonicAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/trc/deploy')
  Future<DeployTokenResponse> deployTRC20ViaMnemonicXPub(
      {@Body() required DeployTokenViaMnemonicXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/trc/deploy')
  Future<DeployTokenResponse> deployTRC20ViaPKAddress(
      {@Body() required DeployTokenViaPrivateKeyAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/trc/deploy')
  Future<DeployTokenResponse> deployTRC20ViaPKXPub(
      {@Body() required DeployTokenViaPrivateKeyXPub body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/trc/deploy')
  Future<DeployTokenResponse> deployTRC20ViaKMSAddress(
      {@Body() required DeployTokenViaKMSAddress body,
      @Path('token') required String token});

  @override
  @POST('offchain/{token}/trc/deploy')
  Future<DeployTokenResponse> deployTRC20ViaKMSXPub(
      {@Body() required DeployTokenViaKMSXPub body,
      @Path('token') required String token});
}
