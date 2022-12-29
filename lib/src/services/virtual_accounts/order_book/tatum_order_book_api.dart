import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tatum/src/global/response/tatum_response.dart';
import 'package:tatum/src/services/virtual_accounts/order_book/entities/ohlc_response.dart';
import 'package:tatum/src/services/virtual_accounts/order_book/models/create_trade_model.dart';
import 'package:tatum/src/services/virtual_accounts/order_book/models/list_data_model.dart';
import 'package:tatum/src/services/virtual_accounts/order_book/models/obtain_chart_data_model.dart';

part 'tatum_order_book_api.g.dart';

abstract class VirtualOrderBookService {
  ///
  ///Store new buy / sell trade. If there is trade already available to fill, fill as much trades as possible.
  ///It is possible to charge fees for the trades. Fees are an extra amount on top of the trade amount and are paid in the currency that you going to block e.g.: - BUY BTC/USDT - fees will be paid in USDT - SELL BTC/ETH - fees will be paid in BTC
  Future<TatumResponse> storeBuySellTrade(
      {@Body() required CreateTradeModel body});

  ///
  ///Obtain data from the closed trades for entering in the chart. Time interval is set between from and to and there is defined time frame. There can be obtained at most 200 time points in the time interval.
  Future<List<OHLCResponse>> obtainChartDataFromHistoricalClosedTrade(
      {@Body() required ObtainChartDataModel body});

  ///
  ///List all historical trades. It is possible to list all trades, trades for specific trading pair and/or account.
  Future<dynamic> listAllHistoricalTrade({@Body() required ListDataModel body});

  ///
  ///List all active buy trades.
  Future<dynamic> listAllActiveBuyTrade({@Body() required ListDataModel body});

  ///
  ///List all active sell trades.
  Future<dynamic> listAllActiveSellTrade({@Body() required ListDataModel body});

  ///
  ///List all matched orders from the FUTURE_BUY OR FUTURE_SELL orders.
  Future<dynamic> listMatchedOrdersFromFutureBorFutureSell(
      {@Body() required ListDataModel body});

  ///
  ///Get existing opened trade.
  Future<dynamic> getExistingOpenTrade({@Path('id') required String id});

  ///
  ///Cancel existing trade.
  Future<dynamic> cancelExistingTrade({@Path('id') required String id});

  ///
  ///Cancel all trades for account.
  Future<dynamic> cancelAllTradesForAccount({@Path('id') required String id});
}

@Singleton(as: VirtualOrderBookService)
@RestApi()
abstract class OrderBookAPI implements VirtualOrderBookService {
  @factoryMethod
  factory OrderBookAPI(Dio dio) = _OrderBookAPI;

  @override
  @POST('trade')
  Future<TatumResponse> storeBuySellTrade(
      {@Body() required CreateTradeModel body});

  @override
  @POST('trade/chart')
  Future<List<OHLCResponse>> obtainChartDataFromHistoricalClosedTrade(
      {@Body() required ObtainChartDataModel body});

  @override
  @POST('trade/history')
  Future<dynamic> listAllHistoricalTrade({@Body() required ListDataModel body});

  @override
  @POST('trade/buy')
  Future<dynamic> listAllActiveBuyTrade({@Body() required ListDataModel body});

  @override
  @POST('trade/sell')
  Future<dynamic> listAllActiveSellTrade({@Body() required ListDataModel body});

  @override
  @POST('trade/matched')
  Future<dynamic> listMatchedOrdersFromFutureBorFutureSell(
      {@Body() required ListDataModel body});

  @override
  @GET('trade/{id}')
  Future<dynamic> getExistingOpenTrade({@Path('id') required String id});

  @override
  @DELETE('trade/{id}')
  Future<dynamic> cancelExistingTrade({@Path('id') required String id});

  @override
  @DELETE('trade/account/{id}')
  Future<dynamic> cancelAllTradesForAccount({@Path('id') required String id});
}
