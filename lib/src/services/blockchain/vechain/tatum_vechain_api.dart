import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_address_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_private_key_response.dart';
import 'package:tatum/src/services/blockchain/bitcoin/models/generate_private_key_model.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/account_balance_response.dart';
import 'package:tatum/src/services/blockchain/vechain/entities/energy_response.dart';
import 'package:tatum/src/services/blockchain/vechain/entities/generate_vechain_wallet.dart';
import 'package:tatum/src/services/blockchain/vechain/entities/get_vechain_block_by_hash_response.dart';
import 'package:tatum/src/services/blockchain/vechain/models/send_vechain_model.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/create_account_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/tatum.dart';

part 'tatum_vechain_api.g.dart';

abstract class VeChainService {
  ///
  ///Tatum supports BIP44 HD wallets. It is very convenient and secure, since it can generate 2^31 addresses from 1 mnemonic phrase. Mnemonic phrase consists of 24 special words in defined order and can restore access to all generated addresses and private keys.
  ///Each address is identified by 3 main values:
  ///Private Key - your secret value, which should never be revealed
  ///Public Key - public address to be published
  ///Derivation index - index of generated address
  ///Tatum follows BIP44 specification and generates for VeChain wallet with derivation path m'/44'/818'/0'/0. More about BIP44 HD wallets can be found here - https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki. Generate BIP44 compatible VeChain wallet.
  Future<GenerateVeChainWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Generate VeChain account deposit address from Extended public key. Deposit address is generated for the specific index - each extended public key can generate up to 2^31 addresses starting from index 0 until 2^31.
  Future<GenerateAddressResponse> generateVeChainAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  ///
  ///Generate private key of address from mnemonic for given derivation path index. Private key is generated for the specific index - each mnemonic can generate up to 2^32 private keys starting from index 0 until 2^31 - 1.
  Future<GeneratePrivateKeysResponse> generateVeChainPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  ///
  ///Get VeChain current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get VeChain Block by block hash or block number.
  Future<GetVeChainBlockByHashResponse> getVeChainBlockByHash(
      {@Path('hash') required String hash});

  ///
  ///Get VeChain account balance in VeChain. This method does not prints any balance of the ERC20 or ERC721 tokens on the account.
  Future<AccountBalanceResponse> getVeChainAccountBalance(
      {@Path('address') required String address});

  ///
  ///Get VeChain Account energy in VTHO. VTHO is used for paying for the transaction fee.
  Future<EnergyResponse> getVeChainAccountEnergy(
      {@Path('address') required String address});

  ///Get VeChain transaction by transaction hash.
  Future<dynamic> getVeChainTransaction({@Path('hash') required String hash});

  ///
  ///Get VeChain Transaction Receipt by transaction hash. Transaction receipt is available only after transaction is included in the block and contains information about paid fee or created contract address and much more.
  Future<dynamic> getVeChainTransactionReceipt(
      {@Path('hash') required String hash});

  ///
  ///Send VET from account to account. Fee for the transaction is paid in VTHO.
  ///This operation needs the private key of the blockchain address.
  ///Every time the funds are transferred, the transaction must be signed with the corresponding private key.
  ///No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds.
  ///In this method, it is possible to enter privateKey or signatureId.
  ///PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds.
  ///In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the
  ///Tatum client library for supported languages.
  Future<TXIDResponse> sendVeChain({@Body() required SendVeChainModel body});

  ///
  ///Broadcast signed transaction to VeChain blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: VeChainService)
@RestApi()
abstract class VeChainAPI implements VeChainService {
  @factoryMethod
  factory VeChainAPI(Dio dio) = _VeChainAPI;

  @override
  @GET('vet/wallet')
  Future<GenerateVeChainWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('vet/address/{xpub}/{index}')
  Future<GenerateAddressResponse> generateVeChainAccountAddressFromXPubKey(
      {@Path('xpub') required String xpub, @Path('index') required int index});

  @override
  @POST('vet/wallet/priv')
  Future<GeneratePrivateKeysResponse> generateVeChainPrivateKey(
      {@Body() required GeneratePrivateKeyModel body});

  @override
  @GET('vet/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('vet/block/{hash}')
  Future<GetVeChainBlockByHashResponse> getVeChainBlockByHash(
      {@Path('hash') required String hash});

  @override
  @GET('vet/account/balance/{address}')
  Future<AccountBalanceResponse> getVeChainAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('vet/account/energy/{address}')
  Future<EnergyResponse> getVeChainAccountEnergy(
      {@Path('address') required String address});

  @override
  @GET('vet/transaction/{hash}')
  Future<dynamic> getVeChainTransaction({@Path('hash') required String hash});

  @override
  @GET('vet/transaction/{hash}/receipt')
  Future<dynamic> getVeChainTransactionReceipt(
      {@Path('hash') required String hash});

  @override
  @POST('vet/transaction')
  Future<TXIDResponse> sendVeChain({@Body() required SendVeChainModel body});

  @override
  @POST('vet/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
