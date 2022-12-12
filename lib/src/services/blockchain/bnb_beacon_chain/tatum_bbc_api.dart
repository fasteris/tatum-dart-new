import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/bitcoin/entities/generate_wallet_response.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/models/send_model.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/get_bbc_transaction_block_response.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/get_binance_account_response.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/get_binance_tx_by_address_response.dart';

import 'enums/address_type.dart';

part 'tatum_bbc_api.g.dart';

@Singleton(as: BBCService)
@RestApi()
abstract class BBCAPI implements BBCService {
  @factoryMethod
  factory BBCAPI(Dio dio) = _BBCAPI;

  @override
  @GET('bnb/account')
  Future<GenerateBitcoinWalletResponse> generateWallet();

  @override
  @GET('bnb/block/current')
  Future<int> getBinanceCurrentBlock();

  @override
  @GET('bnb/block/{height}')
  Future<GetBinanceTxInBlockResponse> getBinanceTransactionInBlock(
      {@Path('height') required int height});

  @override
  @GET('bnb/account/{address}')
  Future<GetBinanceAccountResponse> getBinanceAccount(
      {@Path('address') required String address});

  @override
  @GET('bnb/transaction/{hash}')
  Future<GetBinanceAccountResponse> getBinanceTransaction(
      {@Path('hash') required String hash});

  @override
  @GET('bnb/account/transaction/{address}')
  Future<GetBinanceTxByAddressResponse> getBinanceTransactionByAddress(
      {@Path('address') required String address,
      @Query('startTime') required int startTime,
      @Query('endTime') required int endTime,
      @Query('limit') int? limit,
      @Query('offset') int? offset,
      @Query('asset') String? asset,
      @Query('addressType') String? addressType});

  @override
  @POST('bnb/transaction')
  Future<SendAlgoResponse> send({@Body() required SendModel body});

  @override
  @POST('bnb/broadcast')
  Future<SendAlgoResponse> broadcast({@Body() required BroadcastModel body});
}

///Binance Smart Chain
abstract class BBCService {
  ///
  ///Generate BNB account. Tatum does not support HD wallet for BNB, only specific address and private key can be generated.
  Future<GenerateBitcoinWalletResponse> generateWallet();

  ///
  ///Get Binance current block number.
  Future<int> getBinanceCurrentBlock();

  ///
  ///Get Transactions in block by block height.
  Future<GetBinanceTxInBlockResponse> getBinanceTransactionInBlock(
      {@Path('height') required int height});

  ///
  ///Get Binance Account Detail by address.
  Future<GetBinanceAccountResponse> getBinanceAccount(
      {@Path('address') required String address});

  ///
  ///Get Binance Transaction by transaction hash.
  Future<GetBinanceAccountResponse> getBinanceTransaction(
      {@Path('hash') required String hash});

  ///
  ///Get Binance Transactions by address.
  Future<GetBinanceTxByAddressResponse> getBinanceTransactionByAddress(
      {@Path('address') required String address,
      @Query('startTime') required int startTime,
      @Query('endTime') required int endTime,
      @Query('limit') int? limit,
      @Query('offset') int? offset,
      @Query('asset') String? asset,
      @Query('addressType') String? addressType});

  ///
  ///Send Binance or Binance Token token from account to account.
  ///This operation needs the private key of the blockchain address.
  ///Every time the funds are transferred, the transaction must be signed with the corresponding private key.
  ///No one should ever send it's own private keys to the internet because there is a strong possibility of stealing keys and loss of funds.
  ///In this method, it is possible to enter privateKey. PrivateKey should be used only for quick development on testnet versions of blockchain when there is no risk of losing funds.
  ///In production, Tatum KMS should be used for the highest security standards, and signatureId should be present in the request.
  ///Alternatively, using the Tatum client library for supported languages.
  Future<SendAlgoResponse> send({@Body() required SendModel body});

  ///
  ///Broadcast signed transaction to Binance blockchain.
  ///This method is used internally or Tatum client libraries.
  ///It is possible to create custom signing mechanism and use this method only for broadcasting data to the blockchain.
  Future<SendAlgoResponse> broadcast({@Body() required BroadcastModel body});
}
