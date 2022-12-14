import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/celo/entities/get_celo_account_balance_response.dart';
import 'package:tatum/src/services/blockchain/celo/models/send_celo_model.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/account_balance_response.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/egld_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/elrond_mnemonic_response.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/elrond/models/send_elrond_model.dart';

part 'tatum_elrond_api.g.dart';

///Binance Smart Chain
abstract class ElrondService {
  ///
  ///The Elrond Address format is bech32, specified by the BIP 0173. The address always starts with an erd1. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for EGLD wallet with derivation path m'/44'/508'/0'/0'. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible EGLD wallet.
  Future<ElrondMnemonicResponse> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate EGLD account deposit address from mnemonic phrase. Deposit address is generated for the specific index - each mnemonic phrase can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateEgldAccountAddressFromMnemonic(
      {@Path('mnemonic') required String mnemonic,
      @Path('index') required int index});

  ///
  ///1 credits per API call
  ///Generate private key for address from mnemonic for given derivation path index.
  ///Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateEgldPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get Elrond current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get Elrond block by block hash or block number.
  Future<EGLDBlockByHashResponse> getEgldBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get account balance in EGLD.
  Future<AccountBalanceResponse> getEgldAccountBalance(
      {@Path('address') required String address});

  ///
  ///Get EGLD transaction by transaction hash. Detail result please find here EGLD docs
  Future<EgldTransactionEntity> getEgldTransaction(
      {@Path('hash') required String hash});

  ///
  ///Get a number of outgoing EGLD transactions for the address. When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain. To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  @GET('egld/transaction/count/{address}')
  Future<int> countOutgoingEgldTransaction(
      {@Path('address') required String address});

  ///
  ///Send EGLD from account to account.
  ///This operation needs the private key of the blockchain address.
  ///Every time the funds are transferred, the transaction must be signed with the corresponding private key.
  ///No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds. In this method, it is possible to enter privateKey or signatureId.
  ///PrivateKey should be used only for quick development on devnet versions of blockchain when there is no risk of losing funds. In production,
  ///Tatum KMS should be used for the highest security standards, and signatureId should be present in the request.
  ///Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> send({@Body() required SendElrondModel body});

  ///
  ///Broadcast signed transaction to EGLD blockchain. 
  ///This method is used internally from Tatum KMS or Tatum client libraries. 
  ///It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: ElrondService)
@RestApi()
abstract class ElrondAPI implements ElrondService {
  @factoryMethod
  factory ElrondAPI(Dio dio) = _ElrondAPI;

  @override
  @GET('egld/wallet')
  Future<ElrondMnemonicResponse> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('egld/address/{mnemonic}/{index}')
  Future<GenerateAddressResponse> generateEgldAccountAddressFromMnemonic(
      {@Path('mnemonic') required String mnemonic,
      @Path('index') required int index});

  @override
  @POST('egld/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateEgldPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('egld/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('egld/block/{hash}')
  Future<EGLDBlockByHashResponse> getEgldBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('egld/account/balance/{address}')
  Future<AccountBalanceResponse> getEgldAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('egld/transaction/{hash}')
  Future<EgldTransactionEntity> getEgldTransaction(
      {@Path('hash') required String hash});

  @override
  @GET('egld/transaction/count/{address}')
  Future<int> countOutgoingEgldTransaction(
      {@Path('address') required String address});

  @override
  @POST('egld/transaction')
  Future<TXIDResponse> send({@Body() required SendElrondModel body});

  @override
  @POST('egld/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
