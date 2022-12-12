// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../global/helpers/connectivity_helper.dart' as _i7;
import '../global/interceptor/combining_smart_interceptor.dart' as _i12;
import '../global/interceptor/network_auth_interceptor.dart' as _i8;
import '../global/interceptor/network_error_interceptor.dart' as _i9;
import '../global/interceptor/network_log_interceptor.dart' as _i10;
import '../global/interceptor/network_refresh_interceptor.dart' as _i11;
import '../services/blockchain/algorand/tatum_algorand_api.dart' as _i3;
import '../services/blockchain/bitcoin/tatum_bitcoin_api.dart' as _i5;
import '../services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart' as _i6;
import '../services/blockchain/bnb_smart_chain/tatum_bsc_api.dart' as _i4;
import 'injectible.dart' as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i4.BSCAPI>(registerModule.bscAPI());
  gh.singleton<_i5.BitcoinAPI>(registerModule.bitcoinAPI());
  gh.singleton<_i6.BitcoinCashAPI>(registerModule.bcashAPI());
  gh.singleton<_i7.ConnectivityHelper>(registerModule.connectivityHelper());
  gh.singletonAsync<Map<String, dynamic>>(
      () => registerModule.initDeviceInformation());
  gh.singleton<_i8.NetworkAuthInterceptor>(_i8.NetworkAuthInterceptor());
  gh.singleton<_i9.NetworkErrorInterceptor>(
      _i9.NetworkErrorInterceptor(get<_i7.ConnectivityHelper>()));
  gh.singleton<_i10.NetworkLogInterceptor>(_i10.NetworkLogInterceptor());
  gh.singleton<_i11.NetworkRefreshInterceptor>(
      _i11.NetworkRefreshInterceptor());
  gh.singleton<_i12.CombiningSmartInterceptor>(
      registerModule.provideCombiningSmartInterceptor(
    get<_i10.NetworkLogInterceptor>(),
    get<_i8.NetworkAuthInterceptor>(),
    get<_i9.NetworkErrorInterceptor>(),
    get<_i11.NetworkRefreshInterceptor>(),
  ));
  gh.singleton<_i13.Dio>(
      registerModule.provideDio(get<_i12.CombiningSmartInterceptor>()));
  gh.singleton<_i3.AlgorandService>(_i3.AlgorandAPI(get<_i13.Dio>()));
  gh.singleton<_i4.BSCService>(_i4.BSCAPI(get<_i13.Dio>()));
  gh.singleton<_i6.BitcoinCashService>(_i6.BitcoinCashAPI(get<_i13.Dio>()));
  gh.singleton<_i5.BitcoinService>(_i5.BitcoinAPI(get<_i13.Dio>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
