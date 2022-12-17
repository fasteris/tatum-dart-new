import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/services/virtual_accounts/account/entities/create_account_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/account/models/create_account_model.dart';

part 'tatum_account_api.g.dart';

abstract class VirtualAccountService {
  ///
  ///Create a new virtual account for a customer.
  ///If the customer that you specified in the request body already exists, the newly created virtual account is added to this customer's list of accounts.
  ///If the customer that you specified in the request body does not exist yet, a new customer is created together with the virtual account, and the virtual account is added to this customer.
  ///You can create a virtual account for any supported cryptocurrency, fiat currency, Tatum virtual currency, or fungible tokens created within Tatum. Once the currency/asset is set for a virtual account, it cannot be changed.
  Future<CreateAccountResponse> createAccount(
      {@Body() required CreateAccountModel body});
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
}
