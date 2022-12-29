import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'tatum_deposits_api.g.dart';

abstract class VirtualDepositsService {
  ///
  ///Lists all deposits for API key.
  Future<dynamic> listAllDepositsForProduct(
      {@Query('pageSize') num? pageSize,
      @Query('page') num? page,
      @Query('sort') String? sort,
      @Query('status') String? status,
      @Query('currency') String? currency,
      @Query('txId') String? txId,
      @Query('to') String? to,
      @Query('acountId') String? accountId});

  ///
  ///Counts total entities found by get deposits request.
  Future<dynamic> countOfFoundDeposits(
      {@Query('pageSize') num? pageSize,
      @Query('page') num? page,
      @Query('sort') String? sort,
      @Query('status') String? status,
      @Query('currency') String? currency,
      @Query('txId') String? txId,
      @Query('to') String? to,
      @Query('acountId') String? accountId});
}

@Singleton(as: VirtualDepositsService)
@RestApi()
abstract class DepositAPI implements VirtualDepositsService {
  @factoryMethod
  factory DepositAPI(Dio dio) = _DepositAPI;

  @override
  @GET('ledger/deposits ')
  Future<dynamic> listAllDepositsForProduct(
      {@Query('pageSize') num? pageSize,
      @Query('page') num? page,
      @Query('sort') String? sort,
      @Query('status') String? status,
      @Query('currency') String? currency,
      @Query('txId') String? txId,
      @Query('to') String? to,
      @Query('acountId') String? accountId});

  @override
  @GET('ledger/deposits/count')
  Future<dynamic> countOfFoundDeposits(
      {@Query('pageSize') num? pageSize,
      @Query('page') num? page,
      @Query('sort') String? sort,
      @Query('status') String? status,
      @Query('currency') String? currency,
      @Query('txId') String? txId,
      @Query('to') String? to,
      @Query('acountId') String? accountId});
}
