import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/transaction/models/find_tx_account_model.dart';
import 'package:tatum/src/services/virtual_accounts/transaction/models/send_payment_batch_model.dart';
import 'package:tatum/src/services/virtual_accounts/transaction/models/send_payment_model.dart';

part 'tatum_transaction_api.g.dart';

abstract class VirtualTransactionService {
  ///
  ///Sends a payment within Tatum Private Ledger. All assets are settled instantly.
  ///When a transaction is settled, 2 transaction records are created, 1 for each of the participants. These 2 records are connected via a transaction reference, which is the same for both of them.
  ///This method is only used for transferring assets between accounts within Tatum and will not send any funds to blockchain addresses.
  Future<dynamic> sendPayment({@Body() required SendPaymentModel body});

  ///
  ///Sends the N payments within Tatum Private Ledger. All assets are settled instantly.
  ///When a transaction is settled, 2 transaction records are created, 1 for each of the participants.
  ///These 2 records are connected via a transaction reference, which is the same for both of them.
  Future<dynamic> sendPaymentInBatch(
      {@Body() required SendPaymentBatchModel body});

  ///
  ///Finds transactions for the account identified by the given account ID.
  Future<dynamic> sendTransactionForAccount(
      {@Body() required FindTxForAccountModel body,
      @Query('pageSize') String? pageSize,
      @Query('offset') int? number,
      @Query('count') bool? count});

  ///
  ///Finds transactions for all accounts of the customer identified by the given internal customer ID.
  Future<dynamic> findTransactionForACustomerAccrossAllCustomerAccount(
      {@Body() required FindTxForAccountModel body,
      @Query('pageSize') String? pageSize,
      @Query('offset') int? number,
      @Query('count') bool? count});

  ///
  ///Find transactions across whole ledger.
  Future<dynamic> findTransactionWithinTheLedger(
      {@Body() required FindTxForAccountModel body,
      @Query('pageSize') String? pageSize,
      @Query('offset') int? number,
      @Query('count') bool? count});

  ///
  ///Finds transactions for all accounts with the given reference.
  Future<dynamic> findTransactionWithAGivenRefAccrossAccount(
      {@Path('reference') required String reference});
}

@Singleton(as: VirtualTransactionService)
@RestApi()
abstract class VirtualTransactionAPI implements VirtualTransactionService {
  @factoryMethod
  factory VirtualTransactionAPI(Dio dio) = _VirtualTransactionAPI;

  @override
  @POST('ledger/transaction')
  Future<dynamic> sendPayment({@Body() required SendPaymentModel body});

  @override
  @POST('ledger/transaction/batch')
  Future<dynamic> sendPaymentInBatch(
      {@Body() required SendPaymentBatchModel body});

  @override
  @POST('ledger/transaction/account')
  Future<dynamic> sendTransactionForAccount(
      {@Body() required FindTxForAccountModel body,
      @Query('pageSize') String? pageSize,
      @Query('offset') int? number,
      @Query('count') bool? count});

  @override
  @POST('ledger/transaction/customer')
  Future<dynamic> findTransactionForACustomerAccrossAllCustomerAccount(
      {@Body() required FindTxForAccountModel body,
      @Query('pageSize') String? pageSize,
      @Query('offset') int? number,
      @Query('count') bool? count});

  @override
  @POST('ledger/transaction/ledger')
  Future<dynamic> findTransactionWithinTheLedger(
      {@Body() required FindTxForAccountModel body,
      @Query('pageSize') String? pageSize,
      @Query('offset') int? number,
      @Query('count') bool? count});

  @override
  @GET('ledger/transaction/reference/{reference}')
  Future<dynamic> findTransactionWithAGivenRefAccrossAccount(
      {@Path('reference') required String reference});
}
