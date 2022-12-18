import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/amount_entity.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/create_account_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/block_account_in_action_model.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/create_account_model.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/unblock_amount_in_account_model.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/update_account_model.dart';

part 'tatum_account_api.g.dart';

///
///A Tatum Account is the primary building block of Tatum-powered applications. It is an envelope that holds essential information about balances, the state of the account or customer, and to whom the account belongs.
///Accounts in Tatum are stored within Tatum Private Ledger. Tatum Private Ledger contains information about accounts, the customers that own the accounts, transactions that affect the accounts or virtual currencies present in the ledger.
///By default, the private ledger is not connected to any blockchain. It is possible to create an application on it without any blockchain at all. Using Tatum Private Ledger and the building blocks included within it, it is possible to quickly swap the whole application from the ledger to any blockchain supported by Tatum. All of the API calls will remain the same, the only thing that changes is the blockchain the application lives on.
///Most blockchains do not have any compliance layer at all. It is not possible to freeze funds at a blockchain address or deactivate an address. The Tatum Account has built-in compliance, and it is possible to block funds in the account, freeze outgoing transactions from the account or even completely deactivate the account.
abstract class VirtualAccountService {
  ///
  ///Create a new virtual account for a customer.
  ///If the customer that you specified in the request body already exists, the newly created virtual account is added to this customer's list of accounts.
  ///If the customer that you specified in the request body does not exist yet, a new customer is created together with the virtual account, and the virtual account is added to this customer.
  ///You can create a virtual account for any supported cryptocurrency, fiat currency, Tatum virtual currency, or fungible tokens created within Tatum. Once the currency/asset is set for a virtual account, it cannot be changed.
  Future<CreateAccountResponse> createAccount(
      {@Body() required CreateAccountModel body});

  ///
  ///Lists all accounts. Inactive accounts are also visible.
  Future<List<CreateAccountResponse>> listAllAccounts(
      {@Query('pageSize') int? pageSize,
      @Query('page') int? page,
      @Query('sort') String? sort,
      @Query('sortBy') int? sortBy,
      @Query('active') bool? active,
      @Query('onlyNonZeroBalance') bool? onlyNonZeroBalance,
      @Query('frozen') bool? frozen,
      @Query('currency') String? currency,
      @Query('accountNumber') bool? accountNumber});

  ///
  ///Count of accounts that were found from /v3/ledger/account
  Future<dynamic> countOfFoundEntitiesForGetAccountRequest(
      {@Query('pageSize') int? pageSize,
      @Query('page') int? page,
      @Query('sort') String? sort,
      @Query('sortBy') int? sortBy,
      @Query('active') bool? active,
      @Query('onlyNonZeroBalance') bool? onlyNonZeroBalance,
      @Query('frozen') bool? frozen,
      @Query('currency') String? currency,
      @Query('accountNumber') bool? accountNumber});

  ///
  ///Creates new accounts for the customer in a batch call.
  Future<List<CreateAccountResponse>> createMultipleAccountsInBatchCall(
      {@Body() required CreateAccountBatchModel body});

  ///
  ///Lists all accounts associated with a customer. Only active accounts are visible.
  Future<List<CreateAccountResponse>> listAllCustomerAccounts(
      {@Path('id') required String id,
      @Query('pageSize') required int pageSize,
      @Query('offset') int? offset,
      @Query('accountCode') String? accountCode});

  ///
  ///Gets active account by ID. Displays all information regarding the given account.
  Future<CreateAccountResponse> getActiveAccountByID(
      {@Path('id') required String id});

  ///
  ///Update account by ID. Only a small number of fields can be updated.
  Future<dynamic> updateAccountById(
      {@Path('id') required String id, @Body() required UpdateAccountModel body});

  ///
  ///Get balance for the account.
  Future<CreateAccountResponse> getAccountBalance(
      {@Path('id') required String id});

  ///
  ///Blocks an amount in an account. Any number of distinct amounts can be blocked in one account.
  ///Every new blockage has its own distinct ID, which is used as a reference. When the amount is blocked,
  ///it is debited from the available balance of the account. The account balance remains the same.
  ///The account balance represents the total amount of funds in the account. The available balance represents the total amount of funds that can be used to perform transactions.
  ///When an account is frozen, the available balance is set to 0 minus all blockages for the account.
  Future<dynamic> blockAmountInAnAccount(
      {@Path('id') required String id,
      @Body() required BlockAmountInAnAccount body});

  ///
  ///Unblocks a previously blocked amount in an account and invokes a ledger transaction from that account to a different recipient. If the request fails, the amount is not unblocked.
  Future<dynamic> unblockAmountInAnAccountToPerformTrns(
      {@Path('id') required String id, @Body() required UnBlockAmountInAnAccount body});

  ///
  ///Unblocks a previously blocked amount in an account. Increases the available balance in the account where the amount was blocked.
  Future<dynamic> unblockABlockedAmountInAccount(
      {@Path('id') required String id});

  ///
  ///Gets blocked amounts for an account.
  Future<List<AmountEntity>> getBlockedAmountsInAccount(
      {@Path('id') required String id,
      @Query('pageSize') required int pageSize,
      @Query('offset') int? offset});

  ///
  ///Gets blocked amount by id.
  Future<AmountEntity> getBlockedAmountById({@Path('id') required String id});

  ///
  ///Unblocks previously blocked amounts in an account. Increases the available balance in the account where the amount was blocked.
  Future<dynamic> unblockAllBlockedAmountInAnAccount(
      {@Path('id') required String id});

  ///
  ///Activate an account.
  Future<dynamic> activateAnAccount(@Path('id') String id);

  ///
  ///Deactivates an account. Only accounts with account and available balances of zero can be deactivated. Deactivated accounts are not visible in the list of accounts, it is not possible to send funds to these accounts or perform transactions. However, they are still present in the ledger and all transaction histories.
  Future<dynamic> deativateAccount(@Path('id') String id);

  ///
  ///Disables all outgoing transactions. Incoming transactions to the account are available. When an account is frozen, its available balance is set to 0. This operation will create a new blockage of type ACCOUNT_FROZEN, which is automatically deleted when the account is unfrozen.
  Future<dynamic> freezeAccount(@Path('id') String id);

  ///
  ///Unfreezes a previously frozen account. Unfreezing a non-frozen account not affect the account.
  Future<dynamic> unfreezeAccount(@Path('id') String id);
}

@Singleton(as: VirtualAccountService)
@RestApi()
abstract class VirtualAccountAPI implements VirtualAccountService {
  @factoryMethod
  factory VirtualAccountAPI(Dio dio) = _VirtualAccountAPI;

  @override
  @POST('ledger/account')
  Future<CreateAccountResponse> createAccount(
      {@Body() required CreateAccountModel body});

  @override
  @GET('ledger/account')
  Future<List<CreateAccountResponse>> listAllAccounts(
      {@Query('pageSize') int? pageSize,
      @Query('page') int? page,
      @Query('sort') String? sort,
      @Query('sortBy') int? sortBy,
      @Query('active') bool? active,
      @Query('onlyNonZeroBalance') bool? onlyNonZeroBalance,
      @Query('frozen') bool? frozen,
      @Query('currency') String? currency,
      @Query('accountNumber') bool? accountNumber});

  @override
  @GET('ledger/account/count')
  Future<dynamic> countOfFoundEntitiesForGetAccountRequest(
      {@Query('pageSize') int? pageSize,
      @Query('page') int? page,
      @Query('sort') String? sort,
      @Query('sortBy') int? sortBy,
      @Query('active') bool? active,
      @Query('onlyNonZeroBalance') bool? onlyNonZeroBalance,
      @Query('frozen') bool? frozen,
      @Query('currency') String? currency,
      @Query('accountNumber') bool? accountNumber});

  @override
  @POST('ledger/account/batch')
  Future<List<CreateAccountResponse>> createMultipleAccountsInBatchCall(
      {@Body() required CreateAccountBatchModel body});

  @override
  @GET('ledger/account/customer/{id}')
  Future<List<CreateAccountResponse>> listAllCustomerAccounts(
      {@Path('id') required String id,
      @Query('pageSize') required int pageSize,
      @Query('offset') int? offset,
      @Query('accountCode') String? accountCode});

  @override
  @GET('ledger/account/{id}')
  Future<CreateAccountResponse> getActiveAccountByID(
      {@Path('id') required String id});

  @override
  @PUT('ledger/account/{id}')
  Future<dynamic> updateAccountById(
      {@Path('id') required String id, @Body() required UpdateAccountModel body});

  @override
  @GET('ledger/account/{id}/balance')
  Future<CreateAccountResponse> getAccountBalance(
      {@Path('id') required String id});

  @override
  @POST('ledger/account/block/{id}')
  Future<dynamic> blockAmountInAnAccount(
      {@Path('id') required String id,
      @Body() required BlockAmountInAnAccount body});

  @override
  @PUT('ledger/account/block/{id}')
  Future<dynamic> unblockAmountInAnAccountToPerformTrns(
      {@Path('id') required String id, @Body() required UnBlockAmountInAnAccount body});

  @override
  @DELETE('ledger/account/block/{id}')
  Future<dynamic> unblockABlockedAmountInAccount(
      {@Path('id') required String id});

  @override
  @GET('ledger/account/block/{id}')
  Future<List<AmountEntity>> getBlockedAmountsInAccount(
      {@Path('id') required String id,
      @Query('pageSize') required int pageSize,
      @Query('offset') int? offset});

  @override
  @GET('ledger/account/block/{id}/detail')
  Future<AmountEntity> getBlockedAmountById({@Path('id') required String id});

  @override
  @DELETE('ledger/account/block/account/{id}')
  Future<dynamic> unblockAllBlockedAmountInAnAccount(
      {@Path('id') required String id});

  @override
  @PUT('ledger/account/{id}/activate')
  Future<dynamic> activateAnAccount(@Path('id') String id);

  @override
  @PUT('ledger/account/{id}/deactivate')
  Future<dynamic> deativateAccount(@Path('id') String id);

  @override
  @PUT('ledger/account/{id}/freeze')
  Future<dynamic> freezeAccount(@Path('id') String id);

  @override
  @PUT('ledger/account/{id}/unfreeze')
  Future<dynamic> unfreezeAccount(@Path('id') String id);
}
