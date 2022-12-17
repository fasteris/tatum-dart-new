import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/stellar/entities/generate_stellar_wallet_response.dart';
import 'package:tatum/src/services/blockchain/stellar/models/create_update_delete_trustline_model.dart';
import 'package:tatum/src/services/blockchain/stellar/models/send_stellar_model.dart';

part 'tatum_stellar_api.g.dart';

///Klaytn
abstract class StellarService {
  ///
  ///Generate Solana private key and account address.
  Future<GenerateStellarWallet> generateWallet();

  ///
  ///Get XLM Blockchain last closed ledger.
  Future<dynamic> getXLMBlockchainInfo();

  ///
  ///Get XLM Blockchain ledger for ledger sequence
  Future<dynamic> getXLMBlockchainLedgerBySequence(
      {@Path('sequence') required String sequence});

  ///
  ///Get XLM Blockchain transactions in the ledger.
  Future<dynamic> getXLMBlockchainTransactionInLedger(
      {@Path('sequence') required String sequence});

  ///
  ///Get XLM Blockchain fee in 1/10000000 of XLM (stroop)
  Future<int> getActualXLMFee();

  ///
  ///List all XLM account transactions.
  Future<dynamic> listAllXLMAccountTransaction(
      {@Path('account') required String account});

  ///
  ///Get XLM Transaction by transaction hash.
  Future<dynamic> getXLMTransactionByHash({@Path('hash') required String hash});

  ///
  ///Get XLM Account detail.
  Future<dynamic> getXLMAccountInfo({@Path('account') required String account});

  ///
  ///Send XLM from account to account. It is possbile to send native XLM asset, or any other custom asset present on the network.
  ///This operation needs the private key of the blockchain address. Every time the funds are transferred, the transaction must be signed with the corresponding private key. No one should ever send it's own
  ///private keys to the internet because there is a strong possibility of stealing keys and loss of funds. In this method, it is possible to enter privateKey or signatureId.
  ///PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds. In production,
  ///Tatum KMS should be used for the highest security standards, and signatureId should be present in the request.
  ///Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> sendXLM({@Body() required SendXLMModel body});

  ///
  ///Create / Update / Delete XLM trust line between accounts to transfer private assets. By creating trustline for the first time, the asset is created automatically and can be used in the transactions.
  ///This operation needs the private key of the blockchain address.
  ///Every time the funds are transferred, the transaction must be signed with the corresponding private key.
  ///No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds.
  ///In this method, it is possible to enter privateKey or signatureId. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds. In production,
  ///Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the
  ///Tatum client library for supported languages.
  Future<TXIDResponse> createUpdateDeleteXLMTrustLine(
      {@Body() required CreateUpdateDeleteTrustlineModel body});

  ///
  ///Broadcast signed transaction to XLM blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcastXLMTransaction(
      {@Body() required BroadcastModel body});
}

@Singleton(as: StellarService)
@RestApi()
abstract class StellarAPI implements StellarService {
  @factoryMethod
  factory StellarAPI(Dio dio) = _StellarAPI;

  @override
  @GET('xlm/account')
  Future<GenerateStellarWallet> generateWallet();

  @override
  @GET('xlm/info')
  Future<dynamic> getXLMBlockchainInfo();

  @override
  @GET('xlm/ledger/{sequence}')
  Future<dynamic> getXLMBlockchainLedgerBySequence(
      {@Path('sequence') required String sequence});

  @override
  @GET('xlm/ledger/{sequence}/transaction')
  Future<dynamic> getXLMBlockchainTransactionInLedger(
      {@Path('sequence') required String sequence});

  @override
  @GET('xlm/fee')
  Future<int> getActualXLMFee();

  @override
  @GET('xlm/account/tx/{account}')
  Future<dynamic> listAllXLMAccountTransaction(
      {@Path('account') required String account});

  @override
  @GET('xlm/transaction/{hash}')
  Future<dynamic> getXLMTransactionByHash({@Path('hash') required String hash});

  @override
  @GET('xlm/account/{account}')
  Future<dynamic> getXLMAccountInfo({@Path('account') required String account});

  @override
  @POST('xlm/transaction')
  Future<TXIDResponse> sendXLM({@Body() required SendXLMModel body});

  @override
  @POST('xlm/trust')
  Future<TXIDResponse> createUpdateDeleteXLMTrustLine(
      {@Body() required CreateUpdateDeleteTrustlineModel body});

  @override
  @POST('xlm/broadcast')
  Future<TXIDResponse> broadcastXLMTransaction(
      {@Body() required BroadcastModel body});
}
