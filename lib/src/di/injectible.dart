import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tatum/src/global/helpers/constants.dart';
import 'package:tatum/src/global/helpers/get_device_info.dart';
import 'package:tatum/src/global/interceptor/combining_smart_interceptor.dart';
import 'package:tatum/src/global/interceptor/network_auth_interceptor.dart';
import 'package:tatum/src/services/blockchain/algorand/tatum_algorand_api.dart';
import 'package:tatum/src/services/blockchain/bitcoin/tatum_bitcoin_api.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart';
import 'package:tatum/src/services/blockchain/bnb_beacon_chain/tatum_bbc_api.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/tatum_bsc_api.dart';
import 'package:tatum/src/services/blockchain/celo/tatum_celo_api.dart';
import 'package:tatum/src/services/blockchain/dogecoin/tatum_dogecoin_api.dart';
import 'package:tatum/src/services/blockchain/elrond/tatum_elrond_api.dart';
import 'package:tatum/src/services/blockchain/ethereum/tatum_ethereum_api.dart';
import 'package:tatum/src/services/blockchain/flow/tatum_flow_api.dart';
import 'package:tatum/src/services/blockchain/harmony/tatum_harmony_api.dart';
import 'package:tatum/src/services/blockchain/klaytn/tatum_klaytn_api.dart';
import 'package:tatum/src/services/blockchain/kucoin/tatum_kucoin_api.dart';
import 'package:tatum/src/services/blockchain/litecoin/tatum_litecoin_api.dart';
import 'package:tatum/src/services/blockchain/polygon/tatum_polygon_api.dart';
import 'package:tatum/src/services/blockchain/solana/tatum_solana_api.dart';
import 'package:tatum/src/services/blockchain/tron/tatum_tron_api.dart';
import 'package:tatum/src/services/blockchain/vechain/tatum_vechain_api.dart';
import 'package:tatum/src/services/blockchain/xinfin/tatum_xinfin_api.dart';
import 'package:tatum/src/services/blockchain/xrp/tatum_xrp_api.dart';
import 'package:tatum/src/services/virtual_accounts/account/tatum_account_api.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_addresses/tatum_blockchain_addresses_api.dart';
import 'package:tatum/src/services/virtual_accounts/blockchain_operations/tatum_blockchain_operations_api.dart';
import 'package:tatum/src/services/virtual_accounts/customer/tatum_customer_api.dart';
import 'package:tatum/src/services/virtual_accounts/deposit/tatum_deposits_api.dart';
import 'package:tatum/src/services/virtual_accounts/order_book/tatum_order_book_api.dart';
import 'package:tatum/src/services/virtual_accounts/transaction/tatum_transaction_api.dart';
import 'package:tatum/src/services/virtual_accounts/virtual_currency/tatum_vc_api.dart';
import 'package:tatum/src/services/virtual_accounts/withdrawal/tatum_withdrawal_api.dart';
import 'injectible.config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {
  // ignore: avoid_print
  print('all ready');
  await $initGetIt(getIt, environment: 'dev');
  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @singleton
  Future<Json> initDeviceInformation() async {
    final deviceInfo = await GetDeviceInfo.initPlatformState();
    return deviceInfo;
  }

  @singleton
  CombiningSmartInterceptor provideCombiningSmartInterceptor(
          NetworkAuthInterceptor authInterceptor) =>
      CombiningSmartInterceptor()..addInterceptor(authInterceptor);

  @singleton
  Dio provideDio(CombiningSmartInterceptor interceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        followRedirects: false,
        validateStatus: (status) {
          return status! >= 200 && status < 300 ||
              status == 304 ||
              status == 422 ||
              status == 401;
        },
      ),
    );
    // ignore: avoid_as
    dio.transformer = DefaultTransformer(jsonDecodeCallback: parseJson);
    dio.interceptors
      ..add(interceptor)
      ..add(
        kDebugMode
            ? PrettyDioLogger(
                requestHeader: true,
                requestBody: true,
                responseBody: false,
                responseHeader: false,
                error: true,
                compact: true,
                maxWidth: 1000,
              )
            : PrettyDioLogger(
                requestHeader: false,
                requestBody: false,
                responseBody: false,
                responseHeader: false,
                error: false,
                compact: false,
                maxWidth: 1000,
              ),
      );
    // ..add(getIt<CacheInterceptor>());
    return dio;
  }

  @singleton
  BitcoinAPI bitcoinAPI() => BitcoinAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  AlgorandAPI algorandAPI() => AlgorandAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  BitcoinCashAPI bcashAPI() => BitcoinCashAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  BSCAPI bscAPI() => BSCAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  BBCAPI bbcAPI() => BBCAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  CeloAPI celoAPI() => CeloAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  DogeCoinAPI dogecoinAPI() => DogeCoinAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  ElrondAPI elrondAPI() => ElrondAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  EthereumAPI ethereumAPI() => EthereumAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  FlowAPI flowAPI() => FlowAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  KlaytnAPI klaytnAPI() => KlaytnAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  HarmonyAPI harmonyAPI() => HarmonyAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  KuCoinAPI kuCoinAPI() => KuCoinAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  LitecoinAPI litecoinAPI() => LitecoinAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  PolygonAPI polygonAPI() => PolygonAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  SolanaAPI solanaAPI() => SolanaAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  TronAPI tronAPI() => TronAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  VeChainAPI veChainAPI() => VeChainAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  XinFinAPI xinfinAPI() => XinFinAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  XRPAPI xrpAPI() => XRPAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  VirtualAccountAPI virtualAccountAPI() => VirtualAccountAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  BlockchainAddressesAPI blockchainAddressesAPI() => BlockchainAddressesAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  BlockchainOperationsAPI blockchainOperationAPI() => BlockchainOperationsAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  VirtualCustomerAPI virtualCustomerAPI() => VirtualCustomerAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  DepositAPI depositAPI() => DepositAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  OrderBookAPI orderBookAPI() => OrderBookAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  VirtualTransactionAPI virtualTransactionAPI() => VirtualTransactionAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  VirtualCurrencyAPI virtualCurrencyAPI() => VirtualCurrencyAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));

  @singleton
  WithdrawalAPI withdrawalAPI() => WithdrawalAPI(
      provideDio(provideCombiningSmartInterceptor(NetworkAuthInterceptor())));
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) =>
    compute<String, dynamic>(_parseAndDecode, text);
