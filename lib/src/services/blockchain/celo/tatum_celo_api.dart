import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_wallet_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/get_binance_tx_by_address_response.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/get_bsc_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/celo/entities/generate_celo_wallet_response.dart';
import 'package:tatum/src/services/blockchain/celo/entities/get_celo_account_balance_response.dart';
import 'package:tatum/src/services/blockchain/celo/models/broadcat_celo_model.dart';
import 'package:tatum/src/services/blockchain/celo/models/send_celo_model.dart';

part 'tatum_celo_api.g.dart';

///Binance Smart Chain
abstract class CeloService {
  ///
  ///Tatum supports BIP44 HD wallets.
  ///It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase.
  ///Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  //Each address is identified by 3 main values:
  //Private Key - your secret value, which should never be revealed
  //Public Key - public address to be published
  //Derivation index - index of generated address
  //Tatum follows BIP44 specification and generates for Celo wallet with derivation path m'/44'/52752'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible Celo wallet.
  Future<GenerateCeloWallet> generateWallet();

  ///
  ///Generate Celo account deposit address from Extended public key.
  ///Deposit address is generated for the specific index - each extended
  ///public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateCeloAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///1 credits per API call
  ///Generate private key for address from mnemonic for given derivation path index.
  ///Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateCeloPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get Celo current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get Celo block by block hash or block number.
  Future<GetBSCBlockByHashResponse> getCeloBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get Celo account balance in BNB. This method does not prints any balance of the BEP20 or BEP721 tokens on the account.
  Future<GetCeloAccountBalanceResponse> getCeloAccountBalance(
      {@Path('address') required String address});

  ///
  ///Get Celo transactions by address.
  ///This includes incoming and outgoing transactions for the address.
  Future<List<GetBinanceTxByAddressResponse>> getCeloTransactionsByAddress(
      {@Path('address') required String address,
      @Query('pageSize') required int pageSize,
      @Query('from') int? from,
      @Query('to') int? to,
      @Query('offset') int? offset,
      @Query('sort') String? sort});

  ///
  ///Get Celo transaction by transaction hash.
  Future<TransactionEntity> getCeloTransaction(
      {@Path('hash') required String hash});

  ///
  ///GGet a number of outgoing Celo transactions for the address.
  ///When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain.
  ///To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  Future<int> countOutgoingCeloTransaction(
      {@Path('address') required String address});

  ///
  ///Send Celo, cUSD or Tatum supported ERC20 token from account to account.
  ///Signing a transaction
  ///When sending CELO, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  Future<TXIDResponse> send({@Body() required SendCeloModel body});

  ///
  ///Broadcast signed transaction to Celo blockchain.
  ///This method is used internally from Tatum KMS or
  ///Tatum client libraries. It is possible to create custom signing mechanism and use this method only for
  ///broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast(
      {@Body() required BroadcastCeloModel body});
}

@Singleton(as: CeloService)
@RestApi()
abstract class CeloAPI implements CeloService {
  @factoryMethod
  factory CeloAPI(Dio dio) = _CeloAPI;

  @override
  @GET('celo/wallet')
  Future<GenerateCeloWallet> generateWallet();

  @override
  @GET('celo/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateCeloAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('celo/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateCeloPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('celo/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('celo/block/{hash}')
  Future<GetBSCBlockByHashResponse> getCeloBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('celo/account/balance/{address}')
  Future<GetCeloAccountBalanceResponse> getCeloAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('celo/account/transaction/{address}')
  Future<List<GetBinanceTxByAddressResponse>> getCeloTransactionsByAddress(
      {@Path('address') required String address,
      @Query('pageSize') required int pageSize,
      @Query('from') int? from,
      @Query('to') int? to,
      @Query('offset') int? offset,
      @Query('sort') String? sort});

  @override
  @GET('celo/transaction/{hash}')
  Future<TransactionEntity> getCeloTransaction(
      {@Path('hash') required String hash});

  @override
  @GET('celo/transaction/count/{address}')
  Future<int> countOutgoingCeloTransaction(
      {@Path('address') required String address});

  @override
  @POST('celo/transaction')
  Future<TXIDResponse> send({@Body() required SendCeloModel body});

  @override
  @POST('celo/broadcast')
  Future<TXIDResponse> broadcast(
      {@Body() required BroadcastCeloModel body});
}
