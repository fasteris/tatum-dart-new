import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/broadcast_signed_algorand_response.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/generate_algorand_address_response.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/generate_algorand_wallet_response.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/get_algorand_account_balance_response.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/get_algorand_by_block_number_response.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/send_algo_response.dart';
import 'package:tatum/src/services/blockchain/algorand/entities/txns_entity.dart';
import 'package:tatum/src/services/blockchain/algorand/models/broadcast_signed_algorand_transaction_model.dart';
import 'package:tatum/src/services/blockchain/algorand/models/enable_receiving_assets_model.dart';
import 'package:tatum/src/services/blockchain/algorand/models/send_algo_model.dart';

import 'package:retrofit/retrofit.dart';

part 'tatum_algorand_api.g.dart';

@Singleton(as: AlgorandService)
@RestApi()
abstract class AlgorandAPI implements AlgorandService {
  @factoryMethod
  factory AlgorandAPI(Dio dio) = _AlgorandAPI;

  @override
  @GET('algorand/wallet')
  Future<GenerateAlgorandWalletResponse> generateWallet();

  @override
  @GET('algorand/address/{secret}')
  Future<GenerateAlgorandAddressResponse> generateAddress(
      {@Path('secret') required String secret});

  @override
  @GET('algorand/account/balance/{address}')
  Future<GetAlgorandAccountBalanceResponse> getAccountBalance(
      {@Path('address') required String address});

  @override
  @GET('algorand/block/current')
  Future<int> getCurrentBlockNumber();

  @override
  @GET('algorand/block/{roundNumber}')
  Future<GetAlgorandByBlockResponse> getByBlockRoundNumber(
      {@Path('roundNumber') required String roundNumber});

  @override
  @POST('algorand/transaction')
  Future<SendAlgoResponse> sendAlgo(
      {@Body() required SendAlgosModel sendAlgosModel});

  @override
  @POST('algorand/asset/receive')
  Future<SendAlgoResponse> enableReceiving(
      {@Body() required EnableReceivingAssetsModel enableReceivingAssetsModel});

  @override
  @GET('algorand/transaction/{txid}')
  Future<TXNSEntity> getAlgorandTransaction(
      {@Path('txid') required String txid});

  @override
  @GET('algorand/broadcast')
  Future<BroadcastSignedAlgorandResponse> broadcast(
      {@Body() required BroadcastSignedAlgorandTransaction data});

// @override
// @POST('verify-email/:{token}')
// Future<dynamic> verifyEmail(@Path("token") String token);
}

abstract class AlgorandService {
  Future<GenerateAlgorandWalletResponse> generateWallet();

  Future<GenerateAlgorandAddressResponse> generateAddress(
      {@Path('secret') required String secret});

  Future<GetAlgorandAccountBalanceResponse> getAccountBalance(
      {@Path('address') required String address});

  Future<int> getCurrentBlockNumber();

  Future<GetAlgorandByBlockResponse> getByBlockRoundNumber(
      {@Path('roundNumber') required String roundNumber});

  Future<SendAlgoResponse> sendAlgo(
      {@Body() required SendAlgosModel sendAlgosModel});

  Future<SendAlgoResponse> enableReceiving(
      {@Body() required EnableReceivingAssetsModel enableReceivingAssetsModel});

  Future<TXNSEntity> getAlgorandTransaction(
      {@Path('txid') required String txid});

  Future<BroadcastSignedAlgorandResponse> broadcast(
      {@Body() required BroadcastSignedAlgorandTransaction data});
}
