import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/create_account_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/create_account_model.dart';

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
      {@Query('pageSize') int pageSize,
      @Query('page') int page,
      @Query('sort') String sort,
      @Query('sortBy') int sortBy,
      @Query('active') bool active,
      @Query('onlyNonZeroBalance') bool onlyNonZeroBalance,
      @Query('frozen') bool frozen,
      @Query('currency') String currency,
      @Query('accountNumber') bool accountNumber});

  ///
  ///Count of accounts that were found from /v3/ledger/account
  Future<dynamic> countOfFoundEntitiesForGetAccountRequest(
      {@Query('pageSize') int pageSize,
      @Query('page') int page,
      @Query('sort') String sort,
      @Query('sortBy') int sortBy,
      @Query('active') bool active,
      @Query('onlyNonZeroBalance') bool onlyNonZeroBalance,
      @Query('frozen') bool frozen,
      @Query('currency') String currency,
      @Query('accountNumber') bool accountNumber});

  ///
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
      {@Query('pageSize') int pageSize,
      @Query('page') int page,
      @Query('sort') String sort,
      @Query('sortBy') int sortBy,
      @Query('active') bool active,
      @Query('onlyNonZeroBalance') bool onlyNonZeroBalance,
      @Query('frozen') bool frozen,
      @Query('currency') String currency,
      @Query('accountNumber') bool accountNumber});

  @override 
  @GET('ledger/account/count')
  Future<dynamic> countOfFoundEntitiesForGetAccountRequest(
      {@Query('pageSize') int pageSize,
      @Query('page') int page,
      @Query('sort') String sort,
      @Query('sortBy') int sortBy,
      @Query('active') bool active,
      @Query('onlyNonZeroBalance') bool onlyNonZeroBalance,
      @Query('frozen') bool frozen,
      @Query('currency') String currency,
      @Query('accountNumber') bool accountNumber});
}
