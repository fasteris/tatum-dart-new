import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/get_balance_response.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/models/send_model.dart';
import 'package:tatum/src/services/blockchain/flow/entities/flow_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/flow/entities/generate_flow_wallet_response.dart';
import 'package:tatum/src/services/blockchain/flow/models/send_flow_model.dart';
import 'package:tatum/src/services/blockchain/harmony/entities/block_entity.dart';
import 'package:tatum/src/services/blockchain/harmony/entities/generate_one_wallet.dart';
import 'package:tatum/src/services/blockchain/harmony/entities/get_ONE_block_by_hash_response.dart';

part 'tatum_harmony_api.g.dart';

///Tatum Harmony
abstract class HarmonyService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for ONE wallet with derivation path m'/44'/60'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible ONE wallet.
  Future<GenerateONEWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate ONE account deposit address from Extended public key.
  ///Deposit address is generated for the specific index - each extended public key can
  /// generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateONEAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Transform HEX address to Bech32 format with one prefix.
  Future<GenerateAddressResponse> transformHEXAddressToBech32ONEAddress(
      {@Path('address') required String address});

  // ///
  // ///Generate Flow address from Extended public key. This operation internally creates public key and assings it to the newly created address on the blockchain. There is minimal amount, which must be sent to the FLOW address during creation - 0.001 FLOW, which will be used from Tatum service account.
  // ///This operation is allowed on any Testnet plan and only on Paid Mainnet plans.
  // ///Public key is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31 - 1.
  // Future<dynamic> generateFlowPublicKeyFromXPubKey(
  //     {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key of address from mnemonic for given derivation
  ///path index. Private key is generated for the specific index - each m
  ///nemonic can generat
  ///e up to 2^31 private keys starting from index 0 until 2^31.
  Future<GeneratePrivateKeysResponse> generateONEPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get ONE current block number. This is the number of the latest block in the blockchain.
  Future<List<BlockEntity>> getCurrentBlockNumber();

  ///
  ///Get flow block by block hash or block number.
  Future<GetONEBlockByHashResponse> getONEBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get ONE account balance in ONE. This method does not prints any balance of the HRM20 or HRM721 tokens on the account.
  Future<GetBalanceResponse> getONEAccountBalance(
      {@Path('address') required String address,
      @Query('shardID') int? shardID});

  ///
  ///Get ONE transaction by transaction hash.
  Future<TransactionEntity> getBSCTransaction(
      {@Path('hash') required String hash});

  // // ///
  // // ///Get $path block by block hash or block number.
  // Future<dynamic> getFlowEventsBlock(
  //     {@Query('type') required String type,
  //     @Query('from') required int from,
  //     @Query('to') required String to});

  // ///
  // ///Get $path block by block hash or block number.
  // Future<dynamic> getFlowTransactionByHash(
  //     {@Path('hash') required String hash});

  ///
  ///Get a number of outgoing ONE transactions for the address. When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain. To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  Future<int> countOutgoingONETransaction(
      {@Path('address') required String address});

  ///Send ONE or Tatum supported HRM20 token from account to account.
  ///Default shard 0 is used for sender and recipient.
  ///Signing a transaction
  ///When sending ONE, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  ///Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> send(
      {@Body() required SendModel body, @Query('shardID') int? shardID});

  ///
  ///Broadcast signed transaction to ONE blockchain. This method is used inte
  ///rnally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and us
  ///e this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast(
      {@Body() required BroadcastModel body, @Query('shardID') int? shardID});
}

@Singleton(as: HarmonyService)
@RestApi()
abstract class HarmonyAPI implements HarmonyService {
  @factoryMethod
  factory HarmonyAPI(Dio dio) = _HarmonyAPI;

  @override
  @GET('one/wallet')
  Future<GenerateONEWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('one/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateONEAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @GET('one/address/format/{address}')
  Future<GenerateAddressResponse> transformHEXAddressToBech32ONEAddress(
      {@Path('address') required String address});

  @override
  @POST('one/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateONEPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('one/block/current')
  Future<List<BlockEntity>> getCurrentBlockNumber();

  @override
  @GET('one/block/{hash}')
  Future<GetONEBlockByHashResponse> getONEBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('one/account/balance/{address}')
  Future<GetBalanceResponse> getONEAccountBalance(
      {@Path('address') required String address,
      @Query('shardID') int? shardID});

  @override
  @GET('one/transaction/{hash}')
  Future<TransactionEntity> getBSCTransaction(
      {@Path('hash') required String hash});

  // @override
  // @GET('flow/block/events')
  // Future<dynamic> getFlowEventsBlock(
  //     {@Query('type') required String type,
  //     @Query('from') required int from,
  //     @Query('to') required String to});

  // @override
  // @GET('flow/trasaction/{hash}')
  // Future<dynamic> getFlowTransactionByHash(
  //     {@Path('hash') required String hash});

  @override
  @GET('one/transaction/count/{address}')
  Future<int> countOutgoingONETransaction(
      {@Path('address') required String address});

  @override
  @POST('one/transaction')
  Future<TXIDResponse> send(
      {@Body() required SendModel body, @Query('shardID') int? shardID});

  @override
  @POST('one/broadcast')
  Future<TXIDResponse> broadcast(
      {@Body() required BroadcastModel body, @Query('shardID') int? shardID});
}
