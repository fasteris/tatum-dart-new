// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i34;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../global/interceptor/combining_smart_interceptor.dart' as _i33;
import '../global/interceptor/network_auth_interceptor.dart' as _i20;
import '../services/blockchain/algorand/tatum_algorand_api.dart' as _i3;
import '../services/blockchain/bitcoin/tatum_bitcoin_api.dart' as _i6;
import '../services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart' as _i7;
import '../services/blockchain/bnb_beacon_chain/tatum_bbc_api.dart' as _i4;
import '../services/blockchain/bnb_smart_chain/tatum_bsc_api.dart' as _i5;
import '../services/blockchain/celo/tatum_celo_api.dart' as _i10;
import '../services/blockchain/dogecoin/tatum_dogecoin_api.dart' as _i12;
import '../services/blockchain/elrond/tatum_elrond_api.dart' as _i13;
import '../services/blockchain/ethereum/tatum_ethereum_api.dart' as _i14;
import '../services/blockchain/flow/tatum_flow_api.dart' as _i15;
import '../services/blockchain/harmony/tatum_harmony_api.dart' as _i16;
import '../services/blockchain/klaytn/tatum_klaytn_api.dart' as _i17;
import '../services/blockchain/kucoin/tatum_kucoin_api.dart' as _i18;
import '../services/blockchain/litecoin/tatum_litecoin_api.dart' as _i19;
import '../services/blockchain/polygon/tatum_polygon_api.dart' as _i22;
import '../services/blockchain/solana/tatum_solana_api.dart' as _i23;
import '../services/blockchain/stellar/tatum_stellar_api.dart' as _i35;
import '../services/blockchain/tron/tatum_tron_api.dart' as _i24;
import '../services/blockchain/vechain/tatum_vechain_api.dart' as _i25;
import '../services/blockchain/xinfin/tatum_xinfin_api.dart' as _i32;
import '../services/blockchain/xrp/tatum_xrp_api.dart' as _i31;
import '../services/virtual_accounts/account/tatum_account_api.dart' as _i26;
import '../services/virtual_accounts/blockchain_addresses/tatum_blockchain_addresses_api.dart'
    as _i8;
import '../services/virtual_accounts/blockchain_operations/tatum_blockchain_operations_api.dart'
    as _i9;
import '../services/virtual_accounts/customer/tatum_customer_api.dart' as _i28;
import '../services/virtual_accounts/deposit/tatum_deposits_api.dart' as _i11;
import '../services/virtual_accounts/order_book/tatum_order_book_api.dart'
    as _i21;
import '../services/virtual_accounts/transaction/tatum_transaction_api.dart'
    as _i29;
import '../services/virtual_accounts/virtual_currency/tatum_vc_api.dart'
    as _i27;
import '../services/virtual_accounts/withdrawal/tatum_withdrawal_api.dart'
    as _i30;
import 'injectible.dart' as _i36; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i8.BlockchainAddressesAPI>(
      registerModule.blockchainAddressesAPI());
  gh.singleton<_i9.BlockchainOperationsAPI>(
      registerModule.blockchainOperationAPI());
  gh.singleton<_i10.CeloAPI>(registerModule.celoAPI());
  gh.singleton<_i11.DepositAPI>(registerModule.depositAPI());
  gh.singleton<_i12.DogeCoinAPI>(registerModule.dogecoinAPI());
  gh.singleton<_i13.ElrondAPI>(registerModule.elrondAPI());
  gh.singleton<_i14.EthereumAPI>(registerModule.ethereumAPI());
  gh.singleton<_i15.FlowAPI>(registerModule.flowAPI());
  gh.singleton<_i16.HarmonyAPI>(registerModule.harmonyAPI());
  gh.singleton<_i17.KlaytnAPI>(registerModule.klaytnAPI());
  gh.singleton<_i18.KuCoinAPI>(registerModule.kuCoinAPI());
  gh.singleton<_i19.LitecoinAPI>(registerModule.litecoinAPI());
  gh.singletonAsync<Map<String, dynamic>>(
      () => registerModule.initDeviceInformation());
  gh.singleton<_i20.NetworkAuthInterceptor>(_i20.NetworkAuthInterceptor());
  gh.singleton<_i21.OrderBookAPI>(registerModule.orderBookAPI());
  gh.singleton<_i22.PolygonAPI>(registerModule.polygonAPI());
  gh.singleton<_i23.SolanaAPI>(registerModule.solanaAPI());
  gh.singleton<_i24.TronAPI>(registerModule.tronAPI());
  gh.singleton<_i25.VeChainAPI>(registerModule.veChainAPI());
  gh.singleton<_i26.VirtualAccountAPI>(registerModule.virtualAccountAPI());
  gh.singleton<_i27.VirtualCurrencyAPI>(registerModule.virtualCurrencyAPI());
  gh.singleton<_i28.VirtualCustomerAPI>(registerModule.virtualCustomerAPI());
  gh.singleton<_i29.VirtualTransactionAPI>(
      registerModule.virtualTransactionAPI());
  gh.singleton<_i30.WithdrawalAPI>(registerModule.withdrawalAPI());
  gh.singleton<_i31.XRPAPI>(registerModule.xrpAPI());
  gh.singleton<_i32.XinFinAPI>(registerModule.xinfinAPI());
  gh.singleton<_i33.CombiningSmartInterceptor>(registerModule
      .provideCombiningSmartInterceptor(get<_i20.NetworkAuthInterceptor>()));
  gh.singleton<_i34.Dio>(
      registerModule.provideDio(get<_i33.CombiningSmartInterceptor>()));
  gh.singleton<_i12.DogeCoinService>(_i12.DogeCoinAPI(get<_i34.Dio>()));
  gh.singleton<_i13.ElrondService>(_i13.ElrondAPI(get<_i34.Dio>()));
  gh.singleton<_i14.EthereumService>(_i14.EthereumAPI(get<_i34.Dio>()));
  gh.singleton<_i15.FlowService>(_i15.FlowAPI(get<_i34.Dio>()));
  gh.singleton<_i16.HarmonyService>(_i16.HarmonyAPI(get<_i34.Dio>()));
  gh.singleton<_i17.KlaytnService>(_i17.KlaytnAPI(get<_i34.Dio>()));
  gh.singleton<_i18.KuCoinService>(_i18.KuCoinAPI(get<_i34.Dio>()));
  gh.singleton<_i19.LitecoinService>(_i19.LitecoinAPI(get<_i34.Dio>()));
  gh.singleton<_i22.PolygonService>(_i22.PolygonAPI(get<_i34.Dio>()));
  gh.singleton<_i23.SolanaService>(_i23.SolanaAPI(get<_i34.Dio>()));
  gh.singleton<_i35.StellarService>(_i35.StellarAPI(get<_i34.Dio>()));
  gh.singleton<_i24.TronService>(_i24.TronAPI(get<_i34.Dio>()));
  gh.singleton<_i25.VeChainService>(_i25.VeChainAPI(get<_i34.Dio>()));
  gh.singleton<_i26.VirtualAccountService>(
      _i26.VirtualAccountAPI(get<_i34.Dio>()));
  gh.singleton<_i8.VirtualBcAddressService>(
      _i8.BlockchainAddressesAPI(get<_i34.Dio>()));
  gh.singleton<_i9.VirtualBcOperationsService>(
      _i9.BlockchainOperationsAPI(get<_i34.Dio>()));
  gh.singleton<_i27.VirtualCurrencyService>(
      _i27.VirtualCurrencyAPI(get<_i34.Dio>()));
  gh.singleton<_i28.VirtualCustomerService>(
      _i28.VirtualCustomerAPI(get<_i34.Dio>()));
  gh.singleton<_i11.VirtualDepositsService>(_i11.DepositAPI(get<_i34.Dio>()));
  gh.singleton<_i21.VirtualOrderBookService>(
      _i21.OrderBookAPI(get<_i34.Dio>()));
  gh.singleton<_i29.VirtualTransactionService>(
      _i29.VirtualTransactionAPI(get<_i34.Dio>()));
  gh.singleton<_i30.VirtualWithdrawalService>(
      _i30.WithdrawalAPI(get<_i34.Dio>()));
  gh.singleton<_i31.XRPService>(_i31.XRPAPI(get<_i34.Dio>()));
  gh.singleton<_i32.XinFinService>(_i32.XinFinAPI(get<_i34.Dio>()));
  gh.singleton<_i3.AlgorandService>(_i3.AlgorandAPI(get<_i34.Dio>()));
  gh.singleton<_i4.BBCService>(_i4.BBCAPI(get<_i34.Dio>()));
  gh.singleton<_i5.BSCService>(_i5.BSCAPI(get<_i34.Dio>()));
  gh.singleton<_i7.BitcoinCashService>(_i7.BitcoinCashAPI(get<_i34.Dio>()));
  gh.singleton<_i6.BitcoinService>(_i6.BitcoinAPI(get<_i34.Dio>()));
  gh.singleton<_i10.CeloService>(_i10.CeloAPI(get<_i34.Dio>()));
  return get;
}

class _$RegisterModule extends _i36.RegisterModule {}
