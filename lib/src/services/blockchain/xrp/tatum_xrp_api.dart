import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/stellar/models/create_update_delete_trustline_model.dart';
import 'package:tatum/src/services/blockchain/xrp/entities/generate_xrp_account.dart';
import 'package:tatum/src/services/blockchain/xrp/models/modify_xrp_model.dart';
import 'package:tatum/src/services/blockchain/xrp/models/send_xrp_model.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/create_account_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/create_account_model.dart';
import 'package:tatum/tatum.dart';

part 'tatum_xrp_api.g.dart';

abstract class XRPService {
  ///
  ///Generate XRP account. Tatum does not support HD wallet for XRP, only specific address and private key can be generated.
  Future<GenerateXRPWallet> generateAccount();

  ///
  ///Get XRP Blockchain last closed ledger index and hash.
  Future<dynamic> getXRPBlockchainInfo();

  ///
  ///Get XRP Blockchain fee.
  ///Standard fee for the transaction is available in the drops.base_fee section and is 10 XRP drops by default.
  ///When there is a heavy traffic on the blockchain, fees are increasing according to current traffic.
  Future<dynamic> generateActualBlkChainFee();

  ///
  ///List all Account transactions.
  Future<dynamic> getAccountTransaction(@Path('account') String account);

  ///
  ///Get ledger by sequence
  Future<dynamic> getLedgerBySequence(@Path('i') int i);

  ///
  ///Get XRP Transaction by transaction hash.
  Future<dynamic> getXRPTransactionByHash(@Path('hash') String hash);

  ///
  ///Get XRP Account info.
  Future<dynamic> getXRPAccountInfo({@Path('account') required String account});

  ///
  ///Get XRP Account Balance. Obtain balance of the XRP and other assets on the account.
  Future<dynamic> getAccountBalance({@Path('account') required String account});

  ///
  ///Send XRP from account to account.
  ///This operation needs the private key of the blockchain address.
  ///Every time the funds are transferred, the transaction must be signed with the corresponding private key.
  ///No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds.
  ///In this method, it is possible to enter privateKey or signatureId. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds.
  ///In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> sendXLM({@Body() required SendXRPModel body});

  ///
  ///Create / Update / Delete XRP trust line between accounts to transfer private assets. By creating trustline for the first time, the asset is created automatically and can be used in the transactions.
  ///Account setting rippling must be enabled on the issuer account before the trust line creation to asset work correctly. Creating a trust line will cause an additional 5 XRP to be blocked on the account.
  ///This operation needs the private key of the blockchain address.
  ///Every time the funds are transferred, the transaction must be signed with the corresponding private key. No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds. In this method, it is possible to enter privateKey or signatureId. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds. In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the Tatum client library for supported languages.
  ///Security
  Future<TXIDResponse> createUpdateDeleteXLMTrustLine(
      {@Body() required CreateUpdateDeleteTrustlineModel body});

  ///
  ///Modify XRP account settings. If an XRP account should be an issuer of the custom asset, this accounts should have rippling enabled to true. In order to support off-chain processing, required destination tag should be set on the account.
  ///This operation needs the private key of the blockchain address. Every time the funds are transferred, the transaction must be signed with the corresponding private key.
  ///No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds.
  ///In this method, it is possible to enter privateKey or signatureId. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds.
  ///In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request. Alternatively, using the Tatum client library for supported languages.
  Future<TXIDResponse> modifyXRPAccount({@Body() required ModifyXRPModel body});

  ///
  ///Broadcast signed transaction to XRP blockchain. This method is used internally from Tatum KMS or Tatum client libraries. It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}

@Singleton(as: XRPService)
@RestApi()
abstract class XRPAPI implements XRPService {
  @factoryMethod
  factory XRPAPI(Dio dio) = _XRPAPI;

  @override
  @GET('xrp/account')
  Future<GenerateXRPWallet> generateAccount();

  @override
  @GET('xrp/info')
  Future<dynamic> getXRPBlockchainInfo();

  @override
  @GET('xrp/fee')
  Future<dynamic> generateActualBlkChainFee();

  @override
  @GET('xrp/account/tx/{account}')
  Future<dynamic> getAccountTransaction(@Path('account') String account);

  @override
  @GET('xrp/ledger/{i}')
  Future<dynamic> getLedgerBySequence(@Path('i') int i);

  @override
  @GET('xrp/transaction/{hash}')
  Future<dynamic> getXRPTransactionByHash(@Path('hash') String hash);

  @override
  @GET('xrp/account/{account}')
  Future<dynamic> getXRPAccountInfo({@Path('account') required String account});

  @override
  @GET('xrp/account/{account}/balance')
  Future<dynamic> getAccountBalance({@Path('account') required String account});

  @override
  @POST('xrp/transaction')
  Future<TXIDResponse> sendXLM({@Body() required SendXRPModel body});

  @override
  @POST('xrp/trust')
  Future<TXIDResponse> createUpdateDeleteXLMTrustLine(
      {@Body() required CreateUpdateDeleteTrustlineModel body});

  @override
  @POST('xrp/account/settings')
  Future<TXIDResponse> modifyXRPAccount({@Body() required ModifyXRPModel body});

  @override
  @POST('xrp/broadcast')
  Future<TXIDResponse> broadcast({@Body() required BroadcastModel body});
}
