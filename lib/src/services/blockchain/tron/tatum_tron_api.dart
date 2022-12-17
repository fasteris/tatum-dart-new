import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/stellar/entities/generate_stellar_wallet_response.dart';
import 'package:tatum/src/services/blockchain/tron/entities/current_tron_block_response.dart';
import 'package:tatum/src/services/blockchain/tron/entities/generate_tron_wallet.dart';
import 'package:tatum/src/services/blockchain/tron/models/create_trc10_model.dart';
import 'package:tatum/src/services/blockchain/tron/models/create_trc20_model.dart';
import 'package:tatum/src/services/blockchain/tron/models/freeze_the_balance_model.dart';
import 'package:tatum/src/services/blockchain/tron/models/send_trc20_model.dart';
import 'package:tatum/src/services/blockchain/tron/models/send_tron10_model.dart';
import 'package:tatum/src/services/blockchain/tron/models/send_trx_model.dart';

part 'tatum_tron_api.g.dart';

///Klaytn
abstract class TronService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for Bitcoin wallet with derivation path m'/44'/195'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/tron/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible Tron wallet.
  Future<GenerateTronWallet> generateWallet();

  ///
  ///Generate a TRON address from the extended public key of the wallet. The address is generated for the specific index - each extended public key can generate up to 2^32 addresses with the index starting from 0 up to 2^31.
  Future<GenerateAddressResponse> generateTronAddressFromXPublicKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key for address from mnemonic for given derivation path index. Private key is generated for the specific index - each mnemonic can generate up to 2^31 private keys starting from index 0 until 2^31.
  Future<GeneratePrivateKeysResponse> generateTronPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get current Tron block.
  Future<CurrentTronBlock> getCurrentTronBlock();

  ///
  ///Get Tron block by hash or height.
  Future<dynamic> getTronBlockByHash({@Path('hash') required String hash});

  ///
  ///Get Tron account by address.
  Future<dynamic> getTronAccountByAddress(
      {@Path('address') required String address});

  ///
  ///Freeze Tron assets on the address. By freezing assets, you can obtain energy or bandwidth to perform transactions.
  Future<TXIDResponse> freezeTheBalanceOfTron(
      {@Body() required FreezeBalanceModel balanceModal});

  ///
  ///Get all transactions for a TRON account.
  Future<dynamic> getAllTransactionFromATronAccount(
      {@Path('address') required String path, @Query('next') String? next});

  ///
  ///Get TRC-20 transactions for a TRON account.
  Future<dynamic> getTRC20TransactionFromATronAccount(
      {@Path('address') required String path, @Query('next') String? next});

  ///
  ///Send an amount in TRX from address to address.
  Future<TXIDResponse> sendTRXtoTron({@Body() required SendTRXModel body});

  ///
  ///Send TRC-10 tokens from address to address.
  Future<TXIDResponse> sendTRC10toTron({@Body() required SendTRC10Model body});

  ///
  ///Send TRC-20 tokens from address to address.
  Future<TXIDResponse> sendTRC20toTron({@Body() required SendTRC20Model body});

  ///
  ///Create a TRON TRC-10 token.
  ///One TRON account can create only one TRC-10 token. The whole supply of the token is transferred to the issuer's account 100 seconds after the token has been created.
  Future<TXIDResponse> createTRC10Token(
      {@Body() required CreateTRC10Model body});

  ///
  ///Get information about a TRON TRC-10 token.
  Future<dynamic> getInfoAboutTRC10Token(
      {@Path('idOrOwnerAddress') required String idOrOwnerAddress});

  ///
  ///Create a TRON TRC-20 token.
  Future<TXIDResponse> createTRC20Token(
      {@Body() required CreateTRC20Model body});

  ///
  ///Get Tron transaction by hash.
  Future<dynamic> getTronTxByHash({@Path('hash') required String hash});

  ///
  ///Broadcast Tron transaction. This method is used internally from Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<dynamic> broadcastTronTransactio(
      {@Body() required BroadcastModel broadcastModel});
}

@Singleton(as: TronService)
@RestApi()
abstract class TronAPI implements TronService {
  @factoryMethod
  factory TronAPI(Dio dio) = _TronAPI;

  @override
  @GET('tron/wallet')
  Future<GenerateTronWallet> generateWallet();

  @override
  @GET('tron/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateTronAddressFromXPublicKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('tron/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateTronPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('tron/info')
  Future<CurrentTronBlock> getCurrentTronBlock();

  @override
  @GET('tron/block/{hash}')
  Future<dynamic> getTronBlockByHash({@Path('hash') required String hash});

  @override
  @GET('tron/account/{address}')
  Future<dynamic> getTronAccountByAddress(
      {@Path('address') required String address});

  @override
  @POST('tron/freezeBalance')
  Future<TXIDResponse> freezeTheBalanceOfTron(
      {@Body() required FreezeBalanceModel balanceModal});

  @override
  @GET('tron/transaction/account/{address}')
  Future<dynamic> getAllTransactionFromATronAccount(
      {@Path('address') required String path, @Query('next') String? next});

  @override
  @GET('tron/transaction/account/{address}/trc20')
  Future<dynamic> getTRC20TransactionFromATronAccount(
      {@Path('address') required String path, @Query('next') String? next});

  @override
  @POST('tron/transaction')
  Future<TXIDResponse> sendTRXtoTron({@Body() required SendTRXModel body});

  @override
  @POST('tron/trc10/transaction')
  Future<TXIDResponse> sendTRC10toTron({@Body() required SendTRC10Model body});

  @override
  @POST('tron/trc20/transaction')
  Future<TXIDResponse> sendTRC20toTron({@Body() required SendTRC20Model body});

  @override
  @POST('tron/trc10/deploy')
  Future<TXIDResponse> createTRC10Token(
      {@Body() required CreateTRC10Model body});

  @override
  @GET('tron/trc10/detail/{idOrOwnerAddress}')
  Future<dynamic> getInfoAboutTRC10Token(
      {@Path('idOrOwnerAddress') required String idOrOwnerAddress});

  @override
  @POST('tron/trc20/deploy')
  Future<TXIDResponse> createTRC20Token(
      {@Body() required CreateTRC20Model body});

  @override
  @GET('tron/transaction/{hash}')
  Future<dynamic> getTronTxByHash({@Path('hash') required String hash});

  @override
  @POST('tron/broadcast')
  Future<dynamic> broadcastTronTransactio(
      {@Body() required BroadcastModel broadcastModel});
}

