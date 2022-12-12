import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_bitcoin_bc_info_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/get_hash_bitcoin_block_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/bcash_tx_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/entities/get_bcash_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/models/send_model.dart';

import '../bitcoin/entities/generate_wallet_response.dart';

part 'tatum_bitcoin_cash_api.g.dart';

@Singleton(as: BitcoinCashService)
@RestApi()
abstract class BitcoinCashAPI implements BitcoinCashService {
  @factoryMethod
  factory BitcoinCashAPI(Dio dio) = _BitcoinCashAPI;

  @override
  @GET('bcash/wallet')
  Future<GenerateBitcoinWalletResponse> generateWallet();

  @override
  @GET('bcash/info')
  Future<GetBitcoinBCInfoResponse> getBCashBlockChainInfo();

  @override
  @GET('bcash/block/hash/{i}')
  Future<GetHashBitcoinBlockResponse> getBCashBlockHash(
      {@Path('i') required int i});

  @override
  @GET('bcash/block/{hash}')
  Future<GetBCashBlockByHashResponse> getBCashBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('bcash/transaction/{hash}')
  Future<GetBCashTransactionResponse> getBCashTransactionByHash(
      {@Path('hash') required String hash});

  @override
  @GET('bcash/transaction/address/{address}')
  Future<GetBCashTransactionResponse> getBCashTransactionByAddress(
      {@Path('address') required String address});

  @override
  @GET('bcash/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateBCashDepositAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('bcash/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateBCashPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @POST('bcash/transaction')
  Future<SendAlgoResponse> sendBCH({@Body() required SendModel body});

  @override
  @POST('bcash/broadcast')
  Future<Map<String, String>> broadcast({@Body() required BroadcastModel body});
}

abstract class BitcoinCashService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for Bitcoin Cash wallet with derivation path m'/44'/145'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible Bitcoin Cash wallet.
  Future<GenerateBitcoinWalletResponse> generateWallet();

  ///
  ///5 credits per API call
  ///Get Bitcoin Cash Blockchain Information. Obtain basic info like testnet / mainnet version of the chain, current block number and it's hash.
  Future<GetBitcoinBCInfoResponse> getBCashBlockChainInfo();

  ///
  ///5 credits per API call
  ///Get Bitcoin Cash Block hash. Returns hash of the block to get the block detail.
  Future<GetHashBitcoinBlockResponse> getBCashBlockHash(
      {@Path('i') required int i});

  ///
  ///5 credits per API call
  ///Get Bitcoin Cash Block detail by block hash or height.
  Future<GetBCashBlockByHashResponse> getBCashBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///5 credits per API call
  ///Get Bitcoin Cash Transaction by transaction hash.
  Future<GetBCashTransactionResponse> getBCashTransactionByHash(
      {@Path('hash') required String hash});

  ///
  ///5 credits per API call
  ///Get Bitcoin Cash Transaction by address. Limit is 50 transaction per response.
  Future<GetBCashTransactionResponse> getBCashTransactionByAddress(
      {@Path('address') required String address});

  ///
  ///5 credits per API call
  ///Generate Bitcoin Cash deposit address from Extended public key.
  ///Deposit address is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31 - 1.
  ///Generates new format of address starting with bitcoincash: in case of mainnet, bchtest: in case of testnet.
  Future<GenerateAddressResponse> generateBCashDepositAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///5 credits per API call
  ///Generate private key for address from mnemonic for given derivation path index.
  ///Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateBCashPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///10 credits per API call
  ///Bitcoin Cash transactions are based on UTXOs. "UTXO" stands for "Unspent Transaction Output". A UTXO is the amount of BCH that remains at a Bitcoin Cash address after a cryptocurrency transaction involving this address has been performed.
  ///The UTXO can then be used as input for a new cryptocurrency transaction. For more information the UTXO, see the Bitcoin user documentation.
  ///You build a BCH transaction by sending BCH from UTXOs. Each UTXO is included in the transaction.
  ///When an UTXO is entered into a transaction, the whole UTXO amount is included and must be spent. For example, address A receives two transactions, T1 with 1 BCH and T2 with 2 BCH. A transaction that consumes the UTXOs from both T1 and T2 will have an available amount of 3 BCH to spend:
  ///1 BCH (from T1) + 2 BCH (from T2) = 3 BCH (to spend in total)
  ///You can send the assets to one or multiple recipients in one transaction. If you send the assets to multiple addresses, each address must have its own amount to receive.
  ///Paying the gas fee and receiving the change
  ///When the amount that the recipients should receive is lower than the amount from the UTXOs, the difference between these two amounts is by default used as the gas fee for the transaction.
  ///Because this amount may be considerable and you may not want to spend it all on the gas fee, you can explicitly specify the fee amount and the blockchain address where any extra funds remaining after covering the fee will be sent (the fee and changeAddress parameters in the request body, correspondingly).
  ///Signing a transaction
  ///When sending BCH, you are charged a fee for the transaction, and you must sign the transaction with the private key of the blockchain address from which the fee will be deducted.
  ///Providing the private key in the API is not a secure way of signing transactions, because the private key can be stolen or exposed. Your private keys should never leave your security perimeter. You should use the private keys only for testing a solution you are building on the testnet of a blockchain.
  ///For signing transactions on the mainnet, we strongly recommend that you use the Tatum Key Management System (KMS) and provide the signature ID instead of the private key in the API. Alternatively, you can use the Tatum JavaScript client.
  Future<SendAlgoResponse> sendBCH({@Body() required SendModel body});

  ///
  ///5 credits per API call
  ///Broadcast signed transaction to Bitcoin Cash blockchain.
  ///This method is used internally from Tatum KMS or Tatum client libraries.
  ///It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<Map<String, String>> broadcast({@Body() required BroadcastModel body});
}
