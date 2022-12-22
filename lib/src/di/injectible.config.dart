// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../global/interceptor/combining_smart_interceptor.dart' as _i24;
import '../global/interceptor/network_auth_interceptor.dart' as _i17;
import '../services/blockchain/algorand/tatum_algorand_api.dart' as _i3;
import '../services/blockchain/bitcoin/tatum_bitcoin_api.dart' as _i6;
import '../services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart' as _i7;
import '../services/blockchain/bnb_beacon_chain/tatum_bbc_api.dart' as _i4;
import '../services/blockchain/bnb_smart_chain/tatum_bsc_api.dart' as _i5;
import '../services/blockchain/celo/tatum_celo_api.dart' as _i8;
import '../services/blockchain/dogecoin/tatum_dogecoin_api.dart' as _i9;
import '../services/blockchain/elrond/tatum_elrond_api.dart' as _i10;
import '../services/blockchain/ethereum/tatum_ethereum_api.dart' as _i11;
import '../services/blockchain/flow/tatum_flow_api.dart' as _i12;
import '../services/blockchain/harmony/tatum_harmony_api.dart' as _i13;
import '../services/blockchain/klaytn/tatum_klaytn_api.dart' as _i14;
import '../services/blockchain/kucoin/tatum_kucoin_api.dart' as _i15;
import '../services/blockchain/litecoin/tatum_litecoin_api.dart' as _i16;
import '../services/blockchain/polygon/tatum_polygon_api.dart' as _i18;
import '../services/blockchain/solana/tatum_solana_api.dart' as _i19;
import '../services/blockchain/stellar/tatum_stellar_api.dart' as _i26;
import '../services/blockchain/tron/tatum_tron_api.dart' as _i20;
import '../services/blockchain/vechain/tatum_vechain_api.dart' as _i21;
import '../services/blockchain/xinfin/tatum_xinfin_api.dart' as _i23;
import '../services/blockchain/xrp/tatum_xrp_api.dart' as _i22;
import '../services/virtual_accounts/account/tatum_account_api.dart' as _i27;
import '../services/virtual_accounts/customer/tatum_customer_api.dart' as _i29;
import '../services/virtual_accounts/transaction/tatum_transaction_api.dart'
    as _i30;
import '../services/virtual_accounts/virtual_currency/tatum_vc_api.dart'
    as _i28;
import 'injectible.dart' as _i31; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i9.DogeCoinAPI>(registerModule.dogecoinAPI());
  gh.singleton<_i10.ElrondAPI>(registerModule.elrondAPI());
  gh.singleton<_i11.EthereumAPI>(registerModule.ethereumAPI());
  gh.singleton<_i12.FlowAPI>(registerModule.flowAPI());
  gh.singleton<_i13.HarmonyAPI>(registerModule.harmonyAPI());
  gh.singleton<_i14.KlaytnAPI>(registerModule.klaytnAPI());
  gh.singleton<_i15.KuCoinAPI>(registerModule.kuCoinAPI());
  gh.singleton<_i16.LitecoinAPI>(registerModule.litecoinAPI());
  gh.singletonAsync<Map<String, dynamic>>(
      () => registerModule.initDeviceInformation());
  gh.singleton<_i17.NetworkAuthInterceptor>(_i17.NetworkAuthInterceptor());
  gh.singleton<_i18.PolygonAPI>(registerModule.polygonAPI());
  gh.singleton<_i19.SolanaAPI>(registerModule.solanaAPI());
  gh.singleton<_i20.TronAPI>(registerModule.tronAPI());
  gh.singleton<_i21.VeChainAPI>(registerModule.veChainAPI());
  gh.singleton<_i22.XRPAPI>(registerModule.xrpAPI());
  gh.singleton<_i23.XinFinAPI>(registerModule.xinfinAPI());
  gh.singleton<_i24.CombiningSmartInterceptor>(registerModule
      .provideCombiningSmartInterceptor(get<_i17.NetworkAuthInterceptor>()));
  gh.singleton<_i25.Dio>(
      registerModule.provideDio(get<_i24.CombiningSmartInterceptor>()));
  gh.singleton<_i9.DogeCoinService>(_i9.DogeCoinAPI(get<_i25.Dio>()));
  gh.singleton<_i10.ElrondService>(_i10.ElrondAPI(get<_i25.Dio>()));
  gh.singleton<_i11.EthereumService>(_i11.EthereumAPI(get<_i25.Dio>()));
  gh.singleton<_i12.FlowService>(_i12.FlowAPI(get<_i25.Dio>()));
  gh.singleton<_i13.HarmonyService>(_i13.HarmonyAPI(get<_i25.Dio>()));
  gh.singleton<_i14.KlaytnService>(_i14.KlaytnAPI(get<_i25.Dio>()));
  gh.singleton<_i15.KuCoinService>(_i15.KuCoinAPI(get<_i25.Dio>()));
  gh.singleton<_i16.LitecoinService>(_i16.LitecoinAPI(get<_i25.Dio>()));
  gh.singleton<_i18.PolygonService>(_i18.PolygonAPI(get<_i25.Dio>()));
  gh.singleton<_i19.SolanaService>(_i19.SolanaAPI(get<_i25.Dio>()));
  gh.singleton<_i26.StellarService>(_i26.StellarAPI(get<_i25.Dio>()));
  gh.singleton<_i20.TronService>(_i20.TronAPI(get<_i25.Dio>()));
  gh.singleton<_i21.VeChainService>(_i21.VeChainAPI(get<_i25.Dio>()));
  gh.singleton<_i27.VirtualAccountService>(
      _i27.VirtualAccountAPI(get<_i25.Dio>()));
  gh.singleton<_i28.VirtualCurrencyService>(
      _i28.VirtualCurrencyAPI(get<_i25.Dio>()));
  gh.singleton<_i29.VirtualCustomerService>(
      _i29.VirtualCustomerAPI(get<_i25.Dio>()));
  gh.singleton<_i30.VirtualTransactionService>(
      _i30.VirtualTransactionAPI(get<_i25.Dio>()));
  gh.singleton<_i22.XRPService>(_i22.XRPAPI(get<_i25.Dio>()));
  gh.singleton<_i23.XinFinService>(_i23.XinFinAPI(get<_i25.Dio>()));
  gh.singleton<_i3.AlgorandService>(_i3.AlgorandAPI(get<_i25.Dio>()));
  gh.singleton<_i4.BBCService>(_i4.BBCAPI(get<_i25.Dio>()));
  gh.singleton<_i5.BSCService>(_i5.BSCAPI(get<_i25.Dio>()));
  gh.singleton<_i7.BitcoinCashService>(_i7.BitcoinCashAPI(get<_i25.Dio>()));
  gh.singleton<_i6.BitcoinService>(_i6.BitcoinAPI(get<_i25.Dio>()));
  gh.singleton<_i8.CeloService>(_i8.CeloAPI(get<_i25.Dio>()));
  return get;
}

class _$RegisterModule extends _i31.RegisterModule {}
