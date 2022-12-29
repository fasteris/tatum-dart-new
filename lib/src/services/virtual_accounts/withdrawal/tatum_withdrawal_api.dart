import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/withdrawal/entities/broadcast_signed_transaction_response.dart';
import 'package:tatum/src/services/virtual_accounts/withdrawal/models/broadcast_signed_tx_model.dart';
import 'package:tatum/src/services/virtual_accounts/withdrawal/models/store_withdrawal_model.dart';

part 'tatum_withdrawal_api.g.dart';

abstract class VirtualWithdrawalService {
  ///
  ///Create a withdrawal from Tatum Ledger account to the blockchain.
  Future<dynamic> storeWithdrawal({@Body() required StoreWithdrawalModel body});

  ///
  ///Get withdrawals.
  Future<dynamic> getWithdrawals(
      {@Query('currency') String? currency,
      @Query('status') String? status,
      @Query('pageSize') required num pageSize,
      @Query('offset') num? offset});

  ///
  ///Invoke complete withdrawal as soon as blockchain transaction ID is available. All other withdrawals for the same currency will be pending unless the last one is processed and marked as completed.
  Future<dynamic> completeWithdrawals(
      {@Path('id') required String id, @Path('txId') required String txId});

  ///
  ///This method is helpful if you need to cancel the withdrawal if the blockchain transaction fails or is not yet processed. This does not cancel already broadcast blockchain transaction, only Tatum internal withdrawal, and the ledger transaction, that was linked to this withdrawal.
  ///By default, the transaction fee is included in the reverted transaction.
  ///There are situations, like sending ERC20 on ETH, TRC token on TRON, XLM or XRP based assets, when the fee should not be reverted, because e.g. the fee is in calculated in Ethereum and transaction was in ERC20 currency.
  ///In this situation, only the transaction amount should be reverted, not the fee.
  Future<dynamic> cancelWithdrawal(
      {@Path('id') required String id, @Query('revert') bool? revert});

  ///
  ///Broadcast signed raw transaction end complete withdrawal associated with it. When broadcast succeeded but it is impossible to complete withdrawal, transaction id of transaction is returned and withdrawal must be completed manually.
  Future<BroadcastSignedTxResponse> broadcastCastSignedTransaction(
      {@Body() required BroadcastSignedTxModel body});
}

@Singleton(as: VirtualWithdrawalService)
@RestApi()
abstract class WithdrawalAPI implements VirtualWithdrawalService {
  @factoryMethod
  factory WithdrawalAPI(Dio dio) = _WithdrawalAPI;

  @override
  @POST('offchain/withdrawal')
  Future<dynamic> storeWithdrawal({@Body() required StoreWithdrawalModel body});

  @override
  @GET('offchain/withdrawal')
  Future<dynamic> getWithdrawals(
      {@Query('currency') String? currency,
      @Query('status') String? status,
      @Query('pageSize') required num pageSize,
      @Query('offset') num? offset});

  @override
  @PUT('offchain/withdrawal/{id}/{txId}')
  Future<dynamic> completeWithdrawals(
      {@Path('id') required String id, @Path('txId') required String txId});

  @override
  @DELETE('offchain/withdrawal/{id}')
  Future<dynamic> cancelWithdrawal(
      {@Path('id') required String id, @Query('revert') bool? revert});

  @override
  @POST('offchain/withdrawal/broadcast')
  Future<BroadcastSignedTxResponse> broadcastCastSignedTransaction(
      {@Body() required BroadcastSignedTxModel body});
}
