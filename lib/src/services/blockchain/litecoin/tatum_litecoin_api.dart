import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_bitcoin_bc_info_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_hash_bitcoin_block_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/litecoin/entities/generate_litecoin_wallet.dart';
import 'package:tatum/src/services/blockchain/litecoin/entities/get_litecoin_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/litecoin/entities/litecoin_transaction_response.dart';
import 'package:tatum/src/services/blockchain/litecoin/models/send_litecoin_model.dart';

part 'tatum_litecoin_api.g.dart';

///Binance Smart Chain
abstract class LitecoinService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for Litecoin wallet with derivation path m'/44'/2'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/litecoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible Litecoin wallet.
  Future<GenerateLitecoinWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate Litecoin deposit address from Extended public key. Deposit address is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31 - 1.
  Future<GenerateAddressResponse> generateLitecoinAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key for address from mnemonic for given derivation path index.
  ///Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateLitecoinPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get Litecoin Blockchain Information. Obtain basic info like testnet / mainnet version of the chain, current block number and it's hash.
  Future<GetBitcoinBCInfoResponse> getLitecoinBlockchainInfo();

  ///
  ///Get Litecoin Block hash. Returns hash of the block to get the block detail.
  Future<GetHashBitcoinBlockResponse> getLitecoinBlockHash(
      {@Path('i') required int i});

  ///
  ///5 credits per API call
  ///Get Litecoin Block detail by block hash or height.
  Future<GetLitecoinBlockByHashResponse> getLitecoinBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///5 credits per API call
  ///Get Lite Transaction detail by transaction hash.
  Future<LitecoinTransactionResponse> getLitecoinTransactionByHash(
      {@Path('hash') required String hash});

  ///
  ///Gets Litecoin transaction IDs in the mempool.
  Future<List<String>> getTransactionFromMempoop();

  ///
  ///Get information about a transaction output in a transaction and check whether this output is a UTXO or has been spent.
  ///"UTXO" stands for "Unspent Transaction Output". A UTXO is the amount of DOGE that remains at a Dogecoin address after a cryptocurrency transaction involving this address has been performed. The UTXO can then be used as input for a new cryptocurrency transaction. For more information about the UTXO, see the Bitcoin user documentation.
  ///If the transaction output is an UTXO, the API returns data about it.
  ///If the transaction output has been spent and there is no UTXO to return, the API returns an error with the 404 response code.
  Future<dynamic> getUTXOLitecoinTransactions(
      {@Path('hash') required String hash, @Path('index') required int index});

  ///
  ///Send LTC to blockchain addresses.
  ///Litecoin transactions are based on UTXOs.
  ///"UTXO" stands for "Unspent Transaction Output".
  ///A UTXO is the amount of LTC that remains at a Litecoin address after a
  /// cryptocurrency transaction involving this address has been performed. The UTXO can then be used as input for a new cryptocurrency transaction. For more information about the UTXO, see the Bitcoin user documentation. To check UTXOs in a transaction, see the API for getting information about a transaction output (UTXO) in a Litecoin transaction.
  Future<TXIDResponse> sendLitecoin({@Body() required SendLitecoinModel body});

  ///
  ///Broadcast signed transaction to Litecoin blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: LitecoinService)
@RestApi()
abstract class LitecoinAPI implements LitecoinService {
  @factoryMethod
  factory LitecoinAPI(Dio dio) = _LitecoinAPI;

  @override
  @GET('litecoin/wallet')
  Future<GenerateLitecoinWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('litecoin/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateLitecoinAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('litecoin/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateLitecoinPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('litecoin/info')
  Future<GetBitcoinBCInfoResponse> getLitecoinBlockchainInfo();

  @override
  @GET('litecoin/block/hash/{i}')
  Future<GetHashBitcoinBlockResponse> getLitecoinBlockHash(
      {@Path('i') required int i});

  @override
  @GET('litecoin/block/{hash}')
  Future<GetLitecoinBlockByHashResponse> getLitecoinBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('litecoin/transaction/{hash}')
  Future<LitecoinTransactionResponse> getLitecoinTransactionByHash(
      {@Path('hash') required String hash});

  @override
  @GET('litecoin/mempool')
  Future<List<String>> getTransactionFromMempoop();

  @override
  @GET('litecoin/utxo/{hash}/{index}')
  Future<dynamic> getUTXOLitecoinTransactions(
      {@Path('hash') required String hash, @Path('index') required int index});

  @override
  @POST('litecoin/transaction')
  Future<TXIDResponse> sendLitecoin({@Body() required SendLitecoinModel body});

  @override
  @POST('litecoin/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
