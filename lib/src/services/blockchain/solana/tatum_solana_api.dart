import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/elrond/entities/account_balance_response.dart';
import 'package:tatum/src/services/blockchain/solana/entities/generate_solana_wallet.dart';
import 'package:tatum/src/services/blockchain/solana/entities/get_solana_by_block_number.dart';
import 'package:tatum/src/services/blockchain/solana/models/send_solana_model.dart';

part 'tatum_solana_api.g.dart';

///Klaytn
abstract class SolanaService {
  ///
  ///Generate Solana private key and account address.
  Future<GenerateSolanaWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  ///
  ///Get Solana current block number. This is the number of the latest block in the blockchain.
  Future<int> getCurrentBlockNumber();

  ///
  ///Get Solana block by block hash or block number.
  ///You can find full data description here - https://docs.solana.com/developing/clients/jsonrpc-api#getblock
  Future<GetSolanaBlockByNumberResponse> getSolanaBlockByNumber(
      {@Path('height') required String height});

  ///
  ///Get Solana account balance in SOL. This method does not prints any balance of the SPL or NFT tokens on the account.
  Future<AccountBalanceResponse> getSolanaAccountBalance(
      {@Path('address') required String address});

  ///Get Solana transaction by transaction hash.
  ///You can find full data description here - https://docs.solana.com/developing/clients/jsonrpc-api#gettransaction
  Future<dynamic> getSolanaTransaction(
      {@Path('hash') required String hash});

  ///Send SOL from account to account.
  ///This operation needs the private key of the blockchain address. Every time the funds are transferred, the transaction must be signed with the corresponding private key. No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds. In this method, it is possible to enter privateKey or signatureId. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds. In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> send({@Body() required SendSOLModel body});

  ///
  ///Broadcast signed transaction to Solana blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: SolanaService)
@RestApi()
abstract class SolanaAPI implements SolanaService {
  @factoryMethod
  factory SolanaAPI(Dio dio) = _SolanaAPI;

  @override
  @GET('solana/wallet')
  Future<GenerateSolanaWallet> generateWallet(
      {@Query('mnemonic') String? mnemonic});

  @override
  @GET('solana/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('solana/block/{hash}')
  Future<GetSolanaBlockByNumberResponse> getSolanaBlockByNumber(
      {@Path('height') required String height});

  @override
  @GET('solana/account/balance/{address}')
  Future<AccountBalanceResponse> getSolanaAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('solana/transaction/{hash}')
  Future<dynamic> getSolanaTransaction(
      {@Path('hash') required String hash});

  @override
  @POST('solana/transaction')
  Future<TXIDResponse> send({@Body() required SendSOLModel body});

  @override
  @POST('solana/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
