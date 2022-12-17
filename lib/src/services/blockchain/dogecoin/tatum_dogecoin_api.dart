import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_wallet_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_bitcoin_bc_info_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_hash_bitcoin_block_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/bcash_tx_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/get_bcash_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/dogecoin/entities/dogecoin_tx_response.dart';
import 'package:tatum/src/services/blockchain/dogecoin/entities/generate_dogecoin_response.dart';
import 'package:tatum/src/services/blockchain/dogecoin/entities/get_dogecoin_block_by_hash.dart';
import 'package:tatum/src/services/blockchain/dogecoin/models/send_dogecoin_model.dart';

part 'tatum_dogecoin_api.g.dart';

///Binance Smart Chain
abstract class DogeCoinService {
  ///
  ///Tatum supports BIP44 HD wallets.
  ///It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase.
  ///Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  //Each address is identified by 3 main values:
  //Private Key - your secret value, which should never be revealed
  //Public Key - public address to be published
  //Derivation index - index of generated address
  //Tatum follows BIP44 specification and generates for DogeCoin wallet with derivation path m'/44'/52752'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible DogeCoin wallet.
  Future<GenerateDogecoinWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate Dogecoin account deposit address from Extended public key.
  ///Deposit address is generated for the specific index - each extended
  ///public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateDogecoinAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key for address from mnemonic for given derivation path index.
  ///Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateDogecoinPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get Dogecoin Blockchain Information. Obtain basic info like testnet / mainnet version of the chain, current block number and it's hash.
  Future<GetBitcoinBCInfoResponse> getDogecoinBlockchainInfo();

  ///
  ///5 credits per API call
  ///Get Dogecoin Block hash. Returns hash of the block to get the block detail.
  Future<GetHashBitcoinBlockResponse> getDogecoinBlockHash(
      {@Path('i') required int i});

  ///
  ///5 credits per API call
  ///Get Dogecoin Block detail by block hash or height.
  Future<GetDogecoinBlockByHashResponse> getDogecoinBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///5 credits per API call
  ///Get Dogecoin Transaction detail by transaction hash.
  Future<DogecoinTransactionResponse> getDogecoinTransactionByHash(
      {@Path('hash') required String hash});

  ///
  ///Gets Dogecoin transaction IDs in the mempool.
  Future<List<String>> getTransactionFromMempoop();

  ///
  ///Get information about a transaction output in a transaction and check whether this output is a UTXO or has been spent.
  ///"UTXO" stands for "Unspent Transaction Output". A UTXO is the amount of DOGE that remains at a Dogecoin address after a cryptocurrency transaction involving this address has been performed. The UTXO can then be used as input for a new cryptocurrency transaction. For more information about the UTXO, see the Bitcoin user documentation.
  ///If the transaction output is an UTXO, the API returns data about it.
  ///If the transaction output has been spent and there is no UTXO to return, the API returns an error with the 404 response code.
  Future<dynamic> getUTXODogecoinTransactions(
      {@Path('hash') required String hash, @Path('index') required int index});

  ///
  ///Send DOGE to blockchain addresses.
  ///Dogecoin transactions are based on UTXOs. "UTXO" stands for "Unspent Transaction Output". A UTXO is the amount of DOGE that remains at a Bitcoin Cash address after a cryptocurrency transaction involving this address has been performed. The UTXO can then be used as input for a new cryptocurrency transaction. For more information the UTXO, see the Bitcoin user documentation. To check UTXOs in a transaction, see the API for getting information about a transaction output (UTXO) in a Dogecoin transaction
  ///You build a DOGE transaction by sending DOGE from UTXOs. Each UTXO is included in the transaction.
  Future<TXIDResponse> sendDogecoin({@Body() required SendDogecoinModel body});

  ///
  ///Broadcast signed transaction to Dogecoin blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: DogeCoinService)
@RestApi()
abstract class DogeCoinAPI implements DogeCoinService {
  @factoryMethod
  factory DogeCoinAPI(Dio dio) = _DogeCoinAPI;

  @override
  @GET('dogecoin/wallet')
  Future<GenerateDogecoinWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('dogecoin/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateDogecoinAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('dogecoin/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateDogecoinPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('dogecoin/info')
  Future<GetBitcoinBCInfoResponse> getDogecoinBlockchainInfo();

  @override
  @GET('dogecoin/block/hash/{i}')
  Future<GetHashBitcoinBlockResponse> getDogecoinBlockHash(
      {@Path('i') required int i});

  @override
  @GET('dogecoin/block/{hash}')
  Future<GetDogecoinBlockByHashResponse> getDogecoinBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('dogecoin/transaction/{hash}')
  Future<DogecoinTransactionResponse> getDogecoinTransactionByHash(
      {@Path('hash') required String hash});

  @override
  @GET('dogecoin/mempool')
  Future<List<String>> getTransactionFromMempoop();

  @override
  @GET('dogecoin/utxo/{hash}/{index}')
  Future<dynamic> getUTXODogecoinTransactions(
      {@Path('hash') required String hash, @Path('index') required int index});

  @override
  @POST('dogecoin/transaction')
  Future<TXIDResponse> sendDogecoin({@Body() required SendDogecoinModel body});

  @override
  @POST('dogecoin/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
