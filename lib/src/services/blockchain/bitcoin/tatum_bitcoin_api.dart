import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/di/injectible.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_wallet_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_balance_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_bitcoin_bc_info_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_bitcoin_block_hash_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_hash_bitcoin_block_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/txs_entity.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';

import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/send_btc_model.dart';

part 'tatum_bitcoin_api.g.dart';

@Singleton(as: BitcoinService)
@RestApi()
abstract class BitcoinAPI implements BitcoinService {
  @factoryMethod
  factory BitcoinAPI(Dio dio) = _BitcoinAPI;

  @override
  @GET('bitcoin/wallet')
  Future<GenerateBitcoinWalletResponse> generateWallet({@Query('mnemonic') String? mnemonic});

  @override
  @GET('bitcoin/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateAddress(
      {@Path('xpub') required String publicKey,
      @Path('index') required int index});

  @override
  @POST('bitcoin/wallet/priv')
  Future<GeneratePrivateKeysResponse> generatePrivateKey({
    @Body() required GeneratePrivateKeyModel body,
  });

  @override
  @GET('bitcoin/info')
  Future<GetBitcoinBCInfoResponse> getBitcoinBCInfo();

  @override
  @GET('bitcoin/block/hash/{i}')
  Future<GetHashBitcoinBlockResponse> getHashOfBitcoinBlock(
      {@Path('i') required String i});

  @override
  @GET('bitcoin/block/{hash}')
  Future<GetBitcoinBlockByHashResponse> getBitcoinBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('bitcoin/address/balance/{address}')
  Future<GetBalanceResponse> getBalance(
      {@Path('address') required String address});

  @override
  @GET('bitcoin/transaction/address/{address}')
  Future<List<TXSEntity>> getAllTransaction(
      {@Path('address') required String address,
      @Query('offset') int offset = 0});

  @override
  @POST('bitcoin/transaction')
  Future<SendAlgoResponse> sendBTC({
    @Body() required SendBTCModel body,
  });

  @override
  @GET('bitcoin/transaction/{hash}')
  Future<TXSEntity> getBTCTransaction({@Path('hash') required String hash});

  @override
  @GET('bitcoin/utxo/{hash}/{index}')
  Future<dynamic> getUTXOBitcoinTransaction(
      {@Path('hash') required String hash, @Path('index') required int index});

  @override
  @GET('bitcoin/mempool')
  Future<List<String>> getTransactionFromMempoop();

  @override
  @POST('bitcoin/broadcast')
  Future<Map<String, String>> broadcast({
    @Body() required BroadcastModel body,
  });

// @override
// @POST('verify-email/:{token}')
// Future<dynamic> verifyEmail(@Path("token") String token);
}

abstract class BitcoinService {
  ///
  ///Tatum supports BIP44 HD wallets. Because they can generate 2^31 addresses from 1 mnemonic phrase, they are very convenient and secure. A mnemonic phrase consists of 24 special words in a defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for Bitcoin wallet with derivation path m'/44'/0'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible Bitcoin wallet.
  Future<GenerateBitcoinWalletResponse> generateWallet();

  ///
  ///Generate a Bitcoin address from the extended public key of the wallet. The address is generated for the specific index - each extended public key can generate up to 2^32 addresses with the index starting from 0 up to 2^31 - 1.
  Future<GenerateAddressResponse> generateAddress(
      {@Path('xpub') required String publicKey,
      @Path('index') required int index});

  ///
  ///Generates a private key for an address from a mnemonic for a given derivation path index. The private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generatePrivateKey({
    @Body() required GeneratePrivateKeyModel body,
  });

  ///Gets Bitcoin services/blockchain information.
  ///Obtains basic info like the testnet / mainnet version of the chain, the current block number and its hash.
  Future<GetBitcoinBCInfoResponse> getBitcoinBCInfo();

  ///
  ///Gets a Bitcoin block hash. Returns the hash of the block to get the block's details.
  Future<GetHashBitcoinBlockResponse> getHashOfBitcoinBlock(
      {@Path('i') required String i});

  ///
  ///Gets Bitcoin block detail by block hash or height.
  Future<GetBitcoinBlockByHashResponse> getBitcoinBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get the balance of a Bitcoin address.
  ///The API returns the balance only if the address has up to 50,000 UTXOs (Unspent Transaction Outputs).
  ///For an address with more than 50,000 UTXOs, the API returns an error with the 403 response code.
  Future<GetBalanceResponse> getBalance(
      {@Path('address') required String address});

  ///
  ///Get all transactions for a Bitcoin address.
  Future<List<TXSEntity>> getAllTransaction(
      {@Path('address') required String address,
      @Query('offset') int offset = 0});

  Future<SendAlgoResponse> sendBTC({
    @Body() required SendBTCModel body,
  });

  ///
  ///Get Bitcoin Transaction detail by transaction hash.
  Future<TXSEntity> getBTCTransaction({@Path('hash') required String hash});

  ///
  ///Get information about a transaction output in a transaction and check whether this output is a UTXO or has been spent. "UTXO" stands for "Unspent Transaction Output".
  ///A UTXO is the amount of BTC/satoshis that remains at a Bitcoin address after a cryptocurrency transaction involving this address has been performed.
  ///The UTXO can then be used as input for a new cryptocurrency transaction.
  ///For more information about Bitcoin transactions and UTXO, see the Bitcoin user documentation.
  ///If the transaction output is an UTXO, the API returns data about it.
  ///If the transaction output has been spent and there is no UTXO to return, the API returns an error with the 404 response code.
  Future<dynamic> getUTXOBitcoinTransaction(
      {@Path('hash') required String hash, @Path('index') required int index});

  ///
  ///Gets Bitcoin transaction IDs in the mempool.
  Future<List<String>> getTransactionFromMempoop();

  ///
  ///Broadcasts a signed transaction to the Bitcoin services/blockchain.
  ///This method is used internally from Tatum KMS or Tatum Client Libraries.
  ///It is possible to create a custom signing mechanism and only use this method for broadcasting data to the services/blockchain.
  ///
  Future<Map<String, String>> broadcast({
    @Body() required BroadcastModel body,
  });
}
