import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/models/send_model.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/account_balance_response.dart';
import 'package:tatum/src/services/blockchain/klaytn/entities/generate_klay_wallet.dart';
import 'package:tatum/src/services/blockchain/klaytn/entities/get_klay_block_by_hash.dart';

part 'tatum_klaytn_api.g.dart';

///Klaytn
abstract class KlaytnService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for Klaytn wallet with derivation path m'/44'/966'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible Klaytn wallet.
  Future<GenerateKlayWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///GGenerate Klaytn account deposit address from Extended public key. Deposit address is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateKlaytnAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key of address from mnemonic for given derivation path index. Private key is generated for the specific index - each mnemonic can generate up to 2^31 private keys starting from index 0 until 2^31.
  Future<GeneratePrivateKeysResponse> generateKlaytnPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get Klaytn current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get Klaytn block by block hash or block number.
  Future<GetKlayBlockByHashResponse> getKlaytnBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Gets an Klaytn account balance in ETH. This method does not display the balance of ERC20 or ERC721 tokens in the account.
  Future<AccountBalanceResponse> getKlaytnAccountBalance(
      {@Path('address') required String address});

  ///Get Klaytn transaction by transaction hash.
  Future<TransactionEntity> getKlaytnTransaction(
      {@Path('hash') required String hash});

  ///
  ///Get a number of outgoing Klaytn transactions for the address. When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain. To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  Future<int> countOutgoingKlaytnTransaction(
      {@Path('address') required String address});

  ///Send KLAY from account to account.
  ///Signing a transaction
  ///When sending KLAY, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  Future<TXIDResponse> send({@Body() required SendModel body});

  ///
  ///Broadcast signed transaction to Klaytn blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: KlaytnService)
@RestApi()
abstract class KlaytnAPI implements KlaytnService {
  @factoryMethod
  factory KlaytnAPI(Dio dio) = _KlaytnAPI;

  @override
  @GET('klaytn/wallet')
  Future<GenerateKlayWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('klaytn/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateKlaytnAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('klaytn/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateKlaytnPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('klaytn/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('klaytn/block/{hash}')
  Future<GetKlayBlockByHashResponse> getKlaytnBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('klaytn/account/balance/{address}')
  Future<AccountBalanceResponse> getKlaytnAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('klaytn/transaction/{hash}')
  Future<TransactionEntity> getKlaytnTransaction(
      {@Path('hash') required String hash});

  @override
  @GET('klaytn/transaction/count/{address}')
  Future<int> countOutgoingKlaytnTransaction(
      {@Path('address') required String address});


  @override
  @POST('klaytn/transaction')
  Future<TXIDResponse> send({@Body() required SendModel body});

  @override
  @POST('klaytn/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});

  
}
