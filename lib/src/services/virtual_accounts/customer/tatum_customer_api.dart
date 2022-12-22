import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/customer/entities/customer_entity.dart';
import 'package:tatum/src/services/virtual_accounts/customer/models/update_customer_model.dart';

part 'tatum_customer_api.g.dart';

abstract class VirtualCustomerService {
  ///
  ///List of all customers. Also inactive an disabled customers are present.
  Future<List<CustomerEntity>> listAllCustomers(
      {@Query('pageSize') required int pageSize, @Query('offset') int? offset});

  ///
  ///Using anonymized external ID or internal customer ID you can access customer detail information. Internal ID is needed to call other customer related methods.
  Future<CustomerEntity> getCustomerDetails({@Path('id') required String id});

  ///
  ///This method is helpful in case your primary system will change ID's or customer will change the country he/she is supposed to be in compliance with.
  Future<CustomerEntity> updateCustomer(
      {@Path('id') required String id,
      @Body() required UpdateCustomerModel body});

  ///
  ///Activated customer is able to do any operation.
  Future<dynamic> activateCustomer({@Path('id') required String id});

  ///
  ///Deactivate customer is not able to do any operation. Customer can be deactivated only when all their accounts are already deactivated.
  Future<dynamic> deactivateCustomer({@Path('id') required String id});

  ///
  ///Enabled customer can perform all operations. By default all customers are enabled. All previously blocked account balances will be unblocked.
  Future<dynamic> enableCustomer({@Path('id') required String id});

  ///
  ///Disabled customer cannot perform end-user operations, such as create new accounts or send transactions. Available balance on all accounts is set to 0. Account balance will stay untouched.
  Future<dynamic> disableCustomer({@Path('id') required String id});
}

@Singleton(as: VirtualCustomerService)
@RestApi()
abstract class VirtualCustomerAPI implements VirtualCustomerService {
  @factoryMethod
  factory VirtualCustomerAPI(Dio dio) = _VirtualCustomerAPI;

  @override
  @GET('ledger/customer')
  Future<List<CustomerEntity>> listAllCustomers(
      {@Query('pageSize') required int pageSize, @Query('offset') int? offset});

  @override
  @GET('ledger/customer/{id}')
  Future<CustomerEntity> getCustomerDetails({@Path('id') required String id});

  @override
  @PUT('ledger/customer/{id}')
  Future<CustomerEntity> updateCustomer(
      {@Path('id') required String id,
      @Body() required UpdateCustomerModel body});

  @override
  @PUT('ledger/customer/{id}/activate')
  Future<dynamic> activateCustomer({@Path('id') required String id});

  @override
  @PUT('ledger/customer/{id}/deactivate')
  Future<dynamic> deactivateCustomer({@Path('id') required String id});

  @override
  @PUT('ledger/customer/{id}/enable')
  Future<dynamic> enableCustomer({@Path('id') required String id});
  
  @override 
  @PUT('ledger/customer/{id}/disable')
  Future<dynamic> disableCustomer({@Path('id') required String id});
}
