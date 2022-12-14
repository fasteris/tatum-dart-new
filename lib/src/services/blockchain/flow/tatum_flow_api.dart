import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/flow/entities/flow_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/flow/entities/generate_flow_wallet_response.dart';
import 'package:tatum/src/services/blockchain/flow/models/send_flow_model.dart';

part 'tatum_flow_api.g.dart';

///Tatum Flow
abstract class FlowService {
  ///
  ///Tatum supports BIP44 HD wallets. Because they can generate 2^31 addresses from 1 mnemonic phrase, they are very convenient and secure. A mnemonic phrase consists of 24 special words in a defined order and can restore access to all generated addresses and private keys
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value which should never be revealed
  ///Public Key - a public address to be published
  ///Derivation index - an index of generated address
  ///Tatum follows the BIP44 specification and generates for flow wallets with the derivation path m/44'/60'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generates a BIP44 compatible flow wallet.
  Future<GenerateFlowWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate Flow address from Extended public key. This operation internally creates public key and assings it to the newly created address on the blockchain. There is minimal amount, which must be sent to the FLOW address during creation - 0.001 FLOW, which will be used from Tatum service account.
  ///This operation is allowed on any Testnet plan and only on Paid Mainnet plans.
  ///Public key is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31 - 1.
  Future<GenerateAddressResponse> generateFlowAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate Flow address from Extended public key. This operation internally creates public key and assings it to the newly created address on the blockchain. There is minimal amount, which must be sent to the FLOW address during creation - 0.001 FLOW, which will be used from Tatum service account.
  ///This operation is allowed on any Testnet plan and only on Paid Mainnet plans.
  ///Public key is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31 - 1.
  Future<dynamic> generateFlowPublicKeyFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generates the private key of an address from a mnemonic for a given derivation path index. The private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateFlowPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get flow current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get flow block by block hash or block number.
  Future<FlowBlockByHashResponse> getFlowBlockByHash(
      {@Path('hash') required String hash});

  // ///
  // ///Get $path block by block hash or block number.
  Future<dynamic> getFlowEventsBlock(
      {@Query('type') required String type,
      @Query('from') required int from,
      @Query('to') required String to});

  ///
  ///Get $path block by block hash or block number.
  Future<dynamic> getFlowTransactionByHash(
      {@Path('hash') required String hash});
  ///
  ///Get Flow account details.
  Future<dynamic> getFlowAccount({@Path('address') required String address});


  ///Send Flow or FUSD to blockchain addresses. Tatum covers the fee connected to the transaction costs in subscription credits. This operation can be done on mainnet only for paid plans.
  ///There are two possibilites how the transaction on the blockchain can be created:
  ///Using mnemonic and index - private key is generated based on the index in the mnemonic.
  ///Using secret - private keys is entered manually.
  ///This operation needs the private key of the blockchain address. Every time the funds are transferred, the transaction must be signed with the corresponding private key. No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and losing funds. In this method, it is possible to enter privateKey or signatureId. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds. In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> send({@Body() required SendFlowModel body});

  ///
  ///Broadcast signed transaction to $path blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});

}

@Singleton(as: FlowService)
@RestApi()
abstract class FlowAPI implements FlowService {
  @factoryMethod
  factory FlowAPI(Dio dio) = _FlowAPI;

  @override
  @GET('flow/wallet')
  Future<GenerateFlowWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('flow/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateFlowAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @GET('flow/pubkey/{xpub}/{index}')
  Future<dynamic> generateFlowPublicKeyFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('flow/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateFlowPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('flow/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('flow/block/{hash}')
  Future<FlowBlockByHashResponse> getFlowBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('flow/block/events')
  Future<dynamic> getFlowEventsBlock(
      {@Query('type') required String type,
      @Query('from') required int from,
      @Query('to') required String to});

  @override
  @GET('flow/trasaction/{hash}')
  Future<dynamic> getFlowTransactionByHash(
      {@Path('hash') required String hash});

  @override
  @GET('flow/account/{address}')
  Future<dynamic> getFlowAccount(
      {@Path('address') required String address});

  @override
  @POST('flow/transaction')
  Future<TXIDResponse> send({@Body() required SendFlowModel body});

  @override
  @POST('flow/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
  
}
