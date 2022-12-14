// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../global/helpers/connectivity_helper.dart' as _i9;
import '../global/interceptor/combining_smart_interceptor.dart' as _i18;
import '../global/interceptor/network_auth_interceptor.dart' as _i14;
import '../global/interceptor/network_error_interceptor.dart' as _i15;
import '../global/interceptor/network_log_interceptor.dart' as _i16;
import '../global/interceptor/network_refresh_interceptor.dart' as _i17;
import '../services/blockchain/algorand/tatum_algorand_api.dart' as _i3;
import '../services/blockchain/bitcoin/tatum_bitcoin_api.dart' as _i6;
import '../services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart' as _i7;
import '../services/blockchain/bnb_beacon_chain/tatum_bbc_api.dart' as _i4;
import '../services/blockchain/bnb_smart_chain/tatum_bsc_api.dart' as _i5;
import '../services/blockchain/celo/tatum_celo_api.dart' as _i8;
import '../services/blockchain/dogecoin/tatum_dogecoin_api.dart' as _i10;
import '../services/blockchain/elrond/tatum_elrond_api.dart' as _i11;
import '../services/blockchain/ethereum/tatum_ethereum_api.dart' as _i12;
import '../services/blockchain/flow/tatum_flow_api.dart' as _i13;
import 'injectible.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AlgorandAPI>(registerModule.algorandAPI());
  gh.singleton<_i4.BBCAPI>(registerModule.bbcAPI());
  gh.singleton<_i5.BSCAPI>(registerModule.bscAPI());
  gh.singleton<_i6.BitcoinAPI>(registerModule.bitcoinAPI());
  gh.singleton<_i7.BitcoinCashAPI>(registerModule.bcashAPI());
  gh.singleton<_i8.CeloAPI>(registerModule.celoAPI());
  gh.singleton<_i9.ConnectivityHelper>(registerModule.connectivityHelper());
  gh.singleton<_i10.DogeCoinAPI>(registerModule.dogecoinAPI());
  gh.singleton<_i11.ElrondAPI>(registerModule.elrondAPI());
  gh.singleton<_i12.EthereumAPI>(registerModule.ethereumAPI());
  gh.singleton<_i13.FlowAPI>(registerModule.flowAPI());
  gh.singletonAsync<Map<String, dynamic>>(
      () => registerModule.initDeviceInformation());
  gh.singleton<_i14.NetworkAuthInterceptor>(_i14.NetworkAuthInterceptor());
  gh.singleton<_i15.NetworkErrorInterceptor>(
      _i15.NetworkErrorInterceptor(get<_i9.ConnectivityHelper>()));
  gh.singleton<_i16.NetworkLogInterceptor>(_i16.NetworkLogInterceptor());
  gh.singleton<_i17.NetworkRefreshInterceptor>(
      _i17.NetworkRefreshInterceptor());
  gh.singleton<_i18.CombiningSmartInterceptor>(
      registerModule.provideCombiningSmartInterceptor(
    get<_i16.NetworkLogInterceptor>(),
    get<_i14.NetworkAuthInterceptor>(),
    get<_i15.NetworkErrorInterceptor>(),
    get<_i17.NetworkRefreshInterceptor>(),
  ));
  gh.singleton<_i19.Dio>(
      registerModule.provideDio(get<_i18.CombiningSmartInterceptor>()));
  gh.singleton<_i10.DogeCoinService>(_i10.DogeCoinAPI(get<_i19.Dio>()));
  gh.singleton<_i11.ElrondService>(_i11.ElrondAPI(get<_i19.Dio>()));
  gh.singleton<_i12.EthereumService>(_i12.EthereumAPI(get<_i19.Dio>()));
  gh.singleton<_i13.FlowService>(_i13.FlowAPI(get<_i19.Dio>()));
  gh.singleton<_i3.AlgorandService>(_i3.AlgorandAPI(get<_i19.Dio>()));
  gh.singleton<_i4.BBCService>(_i4.BBCAPI(get<_i19.Dio>()));
  gh.singleton<_i5.BSCService>(_i5.BSCAPI(get<_i19.Dio>()));
  gh.singleton<_i7.BitcoinCashService>(_i7.BitcoinCashAPI(get<_i19.Dio>()));
  gh.singleton<_i6.BitcoinService>(_i6.BitcoinAPI(get<_i19.Dio>()));
  gh.singleton<_i8.CeloService>(_i8.CeloAPI(get<_i19.Dio>()));
  return get;
}

class _$RegisterModule extends _i20.RegisterModule {}
