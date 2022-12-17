import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/models/send_model.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/account_balance_response.dart';
import 'package:tatum/src/services/blockchain/xinfin/entities/generate_xinfin_wallet.dart';
import 'package:tatum/src/services/blockchain/xinfin/entities/get_xinfin_block_by_hash_response.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/create_account_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/create_account_model.dart';
import 'package:tatum/tatum.dart';

part 'tatum_xinfin_api.g.dart';

abstract class XinFinService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for XDC wallet with derivation path m'/44'/550'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible XDC wallet.
  Future<GenerateXinfinWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate XDC account deposit address from Extended public key. Deposit address is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateXinFinAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key of address from mnemonic for given derivation path index. Private key is generated for the specific index - each mnemonic can generate up to 2^31 private keys starting from index 0 until 2^31.
  Future<GeneratePrivateKeysResponse> generateXinFinPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get XDC current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get XDC block by block hash or block number.
  Future<GetXinFinBlockByHashResponse> getXinFinBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get account balance in XDC. This method does not prints any balance of the ERC20 or ERC721 tokens on the account.
  Future<AccountBalanceResponse> getXinFinAccountBalance(
      {@Path('address') required String address});

  ///
  ///Get XDC transaction by transaction hash.
  Future<dynamic> getXinFinTransaction({@Path('hash') required String hash});

  ///
  ///Get a number of outgoing XDC transactions for the address. When a transaction is sent, there can be multiple outgoing transactions, which are not yet processed by the blockchain. To distinguish between them, there is a counter called a nonce, which represents the order of the transaction in the list of outgoing transactions.
  Future<int> countOutgoingXinFinTransaction(
      {@Path('address') required String address});

  ///
  ///Send XDC or Tatum supported ERC20 token from account to account.
  Future<TXIDResponse> send({@Body() required SendModel body});

  ///
  ///Broadcast signed transaction to XDC blockchain.
  ///This method is used internally from Tatum KMS or Tatum client libraries.
  ///It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: XinFinService)
@RestApi()
abstract class XinFinAPI implements XinFinService {
  @factoryMethod
  factory XinFinAPI(Dio dio) = _XinFinAPI;

  @override
  @GET('xdc/wallet')
  Future<GenerateXinfinWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('xdc/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateXinFinAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('xdc/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateXinFinPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('xdc/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('xdc/block/{hash}')
  Future<GetXinFinBlockByHashResponse> getXinFinBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('xdc/account/balance/{address}')
  Future<AccountBalanceResponse> getXinFinAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('xdc/transaction/{hash}')
  Future<dynamic> getXinFinTransaction({@Path('hash') required String hash});

  @override
  @GET('xdc/transaction/count/{address}')
  Future<int> countOutgoingXinFinTransaction(
      {@Path('address') required String address});

  @override
  @POST('xdc/transaction')
  Future<TXIDResponse> send({@Body() required SendModel body});

  @override
  @POST('xdc/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
