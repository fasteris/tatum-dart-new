import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/services/virtual_accounts/virtual_currency/entities/create_new_vc_response.dart';
import 'package:tatum/src/services/virtual_accounts/virtual_currency/entities/get_vc_response.dart';
import 'package:tatum/src/services/virtual_accounts/virtual_currency/models/create_new_supply_vc_model.dart';
import 'package:tatum/src/services/virtual_accounts/virtual_currency/models/create_vc_model.dart';

part 'tatum_vc_api.g.dart';

abstract class VirtualCurrencyService {
  ///
  ///Create new virtual currency with given supply stored in account. This will create Tatum internal virtual currency. Every virtual currency must be prefixed with VC_.
  Future<CreateVirtualCurrencyResponse> createNewVirtualCurrency(
      {@Body() required CreateNewVCModel body});

  ///
  ///Change base pair and/or base rate of existing virtual currency.
  Future<dynamic> updateVirtualCurrency(
      {@Body() required CreateNewVCModel body});

  ///
  ///Get detail of virtual currency.
  Future<GetVirtualCurrencyResponse> getVirtualCurrency(
      {@Path('name') required String name});

  ///
  ///Create new supply of virtual currency linked on the given accountId. Method increases the total supply of the currency.
  Future<dynamic> createNewSupplyOfVirtualCurrency(
      {@Body() required CreateNewSupplyVCModel body});

  ///
  ///Destroy supply of virtual currency linked on the given accountId. Method decreases the total supply of the currency.
  Future<dynamic> destroySupplyOfNewVirtualCurrency(
      {@Body() required CreateNewSupplyVCModel body});
}

@Singleton(as: VirtualCurrencyService)
@RestApi()
abstract class VirtualCurrencyAPI implements VirtualCurrencyService {
  @factoryMethod
  factory VirtualCurrencyAPI(Dio dio) = _VirtualCurrencyAPI;

  @override
  @POST('ledger/virtualCurrency')
  Future<CreateVirtualCurrencyResponse> createNewVirtualCurrency(
      {@Body() required CreateNewVCModel body});

  @override
  @PUT('ledger/virtualCurrency')
  Future<dynamic> updateVirtualCurrency(
      {@Body() required CreateNewVCModel body});

  @override
  @GET('ledger/virtualCurrency/{name}')
  Future<GetVirtualCurrencyResponse> getVirtualCurrency(
      {@Path('name') required String name});

  @override
  @PUT('ledger/virtualCurrency/mint')
  Future<dynamic> createNewSupplyOfVirtualCurrency(
      {@Body() required CreateNewSupplyVCModel body});

  @override
  @PUT('ledger/virtualCurrency/revoke')
  Future<dynamic> destroySupplyOfNewVirtualCurrency(
      {@Body() required CreateNewSupplyVCModel body});
}
