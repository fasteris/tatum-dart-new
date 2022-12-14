import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/account_balance_response.dart';
import 'package:tatum/src/services/blockchain/ethereum/entities/generate_ethereum_wallet_response.dart';
import 'package:tatum/src/services/blockchain/ethereum/entities/get_eth_block_by_hash.dart';
import 'package:tatum/src/services/blockchain/ethereum/entities/get_ethereum_tr_by_address_response.dart';
import 'package:tatum/src/services/blockchain/ethereum/entities/internal_transaction_entity.dart';
import 'package:tatum/src/services/blockchain/ethereum/models/send_eth_model.dart';

part 'tatum_ethereum_api.g.dart';

///Binance Smart Chain
abstract class EthereumService {
  ///
  ///Tatum supports BIP44 HD wallets. Because they can generate 2^31 addresses from 1 mnemonic phrase, they are very convenient and secure. A mnemonic phrase consists of 24 special words in a defined order and can restore access to all generated addresses and private keys
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value which should never be revealed
  ///Public Key - a public address to be published
  ///Derivation index - an index of generated address
  ///Tatum follows the BIP44 specification and generates for Ethereum wallets with the derivation path m/44'/60'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generates a BIP44 compatible Ethereum wallet.
  Future<GenerateEthereumWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate Ethereum account deposit address from Extended public key.
  ///Deposit address is generated for the specific index - each extended
  ///public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateEthereumAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generates the private key of an address from a mnemonic for a given derivation path index. The private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateEthereumPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get Ethereum current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get Ethereum block by block hash or block number.
  Future<GetEthereumBlockByHashResponse> getEthereumBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Gets an Ethereum account balance in ETH. This method does not display the balance of ERC20 or ERC721 tokens in the account.
  Future<AccountBalanceResponse> getEthereumAccountBalance(
      {@Path('address') required String address});

  ///Get Ethereum transaction by transaction hash.
  Future<TransactionEntity> getEthereumTransaction(
      {@Path('hash') required String hash});

  ///
  ///Get a number of outgoing Ethereum transactions for the address. When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain. To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  Future<int> countOutgoingEthereumTransaction(
      {@Path('address') required String address});

  ///
  ///Get Ethereum transactions by address.
  ///This includes incoming and outgoing transactions for the address.
  Future<GetEthereumTrByAddressResponse> getEthereumTransactionByAddress(
      {@Path('address') required String address,
      @Query('pageSize') required int pageSize,
      @Query('from') int? from,
      @Query('to') int? to,
      @Query('offset') int? offset,
      @Query('sort') String? sort});

  ///Send Ethereum or Tatum supported ERC20 token from account to account.
  ///Signing a transaction
  ///When sending ETH, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  Future<TXIDResponse> send({@Body() required SendEthModel body});

  ///
  ///Broadcast signed transaction to Ethereum blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});

  ///
  ///Get Ethereum internal transactions by address.
  Future<List<InternalTransactionEntity>>
      getEthereumInternalTransactionByAddress(
          {@Path('address') required String address,
          @Query('pageSize') required int pageSize,
          @Query('offset') int? offset});
}

@Singleton(as: EthereumService)
@RestApi()
abstract class EthereumAPI implements EthereumService {
  @factoryMethod
  factory EthereumAPI(Dio dio) = _EthereumAPI;

  @override
  @GET('ethereum/wallet')
  Future<GenerateEthereumWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('ethereum/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateEthereumAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('ethereum/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateEthereumPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('ethereum/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('ethereum/block/{hash}')
  Future<GetEthereumBlockByHashResponse> getEthereumBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('ethereum/account/balance/{address}')
  Future<AccountBalanceResponse> getEthereumAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('ethereum/transaction/{hash}')
  Future<TransactionEntity> getEthereumTransaction(
      {@Path('hash') required String hash});

  @override
  @GET('ethereum/transaction/count/{address}')
  Future<int> countOutgoingEthereumTransaction(
      {@Path('address') required String address});

  @override
  @GET('ethereum/account/transaction/{address}')
  Future<GetEthereumTrByAddressResponse> getEthereumTransactionByAddress(
      {@Path('address') required String address,
      @Query('pageSize') required int pageSize,
      @Query('from') int? from,
      @Query('to') int? to,
      @Query('offset') int? offset,
      @Query('sort') String? sort});

  @override
  @POST('ethereum/transaction')
  Future<TXIDResponse> send({@Body() required SendEthModel body});

  @override
  @POST('ethereum/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});

  @override
  @GET('ethereum/account/transaction/erc20/internal/{address}')
  Future<List<InternalTransactionEntity>>
      getEthereumInternalTransactionByAddress(
          {@Path('address') required String address,
          @Query('pageSize') required int pageSize,
          @Query('offset') int? offset});
}
