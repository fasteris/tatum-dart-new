import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_wallet_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_balance_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/models/send_model.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/get_bsc_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';

part 'tatum_bsc_api.g.dart';

@Singleton(as: BSCService)
@RestApi()
abstract class BSCAPI implements BSCService {
  @factoryMethod
  factory BSCAPI(Dio dio) = _BSCAPI;

  @override
  @GET('bsc/wallet')
  Future<GenerateBitcoinWalletResponse> generateWallet();

  @override
  @GET('bsc/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateBCashDepositAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('bsc/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateBSCPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('bsc/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('bsc/block/{hash}')
  Future<GetBSCBlockByHashResponse> getBSCBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('bsc/account/balance/{address}')
  Future<GetBalanceResponse> getBSCAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('bsc/transaction/{hash}')
  Future<TransactionEntity> getBSCTransaction(
      {@Path('hash') required String hash});

  @override
  @GET('bsc/transaction/count/{address}')
  Future<int> countOutgoingBSCTransaction(
      {@Path('address') required String address});

  @override
  @POST('bsc/transaction')
  Future<SendAlgoResponse> send({@Body() required SendModel body});

  @override
  @POST('bsc/broadcast')
  Future<SendAlgoResponse> broadcast({@Body() required BroadcastModel body});
}

///Binance Smart Chain
abstract class BSCService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for BSC wallet with derivation path m'/44'/60'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible BSC wallet.
  ///Security
  Future<GenerateBitcoinWalletResponse> generateWallet();

  ///
  ///Generate BSC account deposit address from Extended public key.
  ///Deposit address is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateBCashDepositAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///1 credits per API call
  ///Generate private key for address from mnemonic for given derivation path index.
  ///Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateBSCPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get BSC current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get BSC block by block hash or block number.
  Future<GetBSCBlockByHashResponse> getBSCBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get BSC account balance in BNB. This method does not prints any balance of the BEP20 or BEP721 tokens on the account.
  Future<GetBalanceResponse> getBSCAccountBalance(
      {@Path('address') required String address});

  ///
  ///Get BSC transaction by transaction hash.
  Future<TransactionEntity> getBSCTransaction(
      {@Path('hash') required String hash});

  ///
  ///Get a number of outgoing BSC transactions for the address.
  ///When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain.
  ///To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  Future<int> countOutgoingBSCTransaction(
      {@Path('address') required String address});

  ///
  ///Send BNB or Tatum supported BEP20 token from account to account.
  ///Signing a transaction
  ///When sending BNB, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  Future<SendAlgoResponse> send({@Body() required SendModel body});

  ///
  ///Broadcast signed transaction to BSC blockchain. This method is used internally from Tatum KMS or Tatum client libraries.
  ///It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<SendAlgoResponse> broadcast({@Body() required BroadcastModel body});

  ///
  ///Invoke a method in an existing smart contract on BNB Smart Chain.
  ///You can call a read-only or write method.
  ///For read-only methods, the output of the invoked method is returned.
  ///For write methods, the ID of the associated transaction is returned.
  ///Signing a transaction
  ///When invoking a method in a smart contract, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  ///Security
  // Future<SendAlgoResponse> invokeMethodInSmartContractOnBSC(
  //     {@Body() required SendModel body});
}
