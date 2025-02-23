// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../global/helpers/get_device_info.dart' as _i692;
import '../global/interceptor/combining_smart_interceptor.dart' as _i183;
import '../global/interceptor/network_auth_interceptor.dart' as _i1003;
import '../services/blockchain/algorand/tatum_algorand_api.dart' as _i902;
import '../services/blockchain/bitcoin/tatum_bitcoin_api.dart' as _i644;
import '../services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart'
    as _i849;
import '../services/blockchain/bnb_beacon_chain/tatum_bbc_api.dart' as _i400;
import '../services/blockchain/bnb_smart_chain/tatum_bsc_api.dart' as _i962;
import '../services/blockchain/celo/tatum_celo_api.dart' as _i640;
import '../services/blockchain/dogecoin/tatum_dogecoin_api.dart' as _i591;
import '../services/blockchain/elrond/tatum_elrond_api.dart' as _i397;
import '../services/blockchain/ethereum/tatum_ethereum_api.dart' as _i1040;
import '../services/blockchain/flow/tatum_flow_api.dart' as _i966;
import '../services/blockchain/harmony/tatum_harmony_api.dart' as _i881;
import '../services/blockchain/klaytn/tatum_klaytn_api.dart' as _i463;
import '../services/blockchain/kucoin/tatum_kucoin_api.dart' as _i1048;
import '../services/blockchain/litecoin/tatum_litecoin_api.dart' as _i278;
import '../services/blockchain/polygon/tatum_polygon_api.dart' as _i642;
import '../services/blockchain/solana/tatum_solana_api.dart' as _i11;
import '../services/blockchain/stellar/tatum_stellar_api.dart' as _i421;
import '../services/blockchain/tron/tatum_tron_api.dart' as _i803;
import '../services/blockchain/vechain/tatum_vechain_api.dart' as _i364;
import '../services/blockchain/xinfin/tatum_xinfin_api.dart' as _i1011;
import '../services/blockchain/xrp/tatum_xrp_api.dart' as _i809;
import '../services/virtual_accounts/account/tatum_account_api.dart' as _i20;
import '../services/virtual_accounts/blockchain_addresses/tatum_blockchain_addresses_api.dart'
    as _i963;
import '../services/virtual_accounts/blockchain_operations/tatum_blockchain_operations_api.dart'
    as _i670;
import '../services/virtual_accounts/customer/tatum_customer_api.dart' as _i493;
import '../services/virtual_accounts/deposit/tatum_deposits_api.dart' as _i622;
import '../services/virtual_accounts/order_book/tatum_order_book_api.dart'
    as _i640;
import '../services/virtual_accounts/transaction/tatum_transaction_api.dart'
    as _i331;
import '../services/virtual_accounts/virtual_currency/tatum_vc_api.dart'
    as _i1020;
import '../services/virtual_accounts/withdrawal/tatum_withdrawal_api.dart'
    as _i580;
import 'injectible.dart' as _i1006;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.singletonAsync<_i692.Json>(() => registerModule.initDeviceInformation());
  gh.singleton<_i644.BitcoinAPI>(() => registerModule.bitcoinAPI());
  gh.singleton<_i902.AlgorandAPI>(() => registerModule.algorandAPI());
  gh.singleton<_i849.BitcoinCashAPI>(() => registerModule.bcashAPI());
  gh.singleton<_i962.BSCAPI>(() => registerModule.bscAPI());
  gh.singleton<_i400.BBCAPI>(() => registerModule.bbcAPI());
  gh.singleton<_i640.CeloAPI>(() => registerModule.celoAPI());
  gh.singleton<_i591.DogeCoinAPI>(() => registerModule.dogecoinAPI());
  gh.singleton<_i397.ElrondAPI>(() => registerModule.elrondAPI());
  gh.singleton<_i1040.EthereumAPI>(() => registerModule.ethereumAPI());
  gh.singleton<_i966.FlowAPI>(() => registerModule.flowAPI());
  gh.singleton<_i463.KlaytnAPI>(() => registerModule.klaytnAPI());
  gh.singleton<_i881.HarmonyAPI>(() => registerModule.harmonyAPI());
  gh.singleton<_i1048.KuCoinAPI>(() => registerModule.kuCoinAPI());
  gh.singleton<_i278.LitecoinAPI>(() => registerModule.litecoinAPI());
  gh.singleton<_i642.PolygonAPI>(() => registerModule.polygonAPI());
  gh.singleton<_i11.SolanaAPI>(() => registerModule.solanaAPI());
  gh.singleton<_i803.TronAPI>(() => registerModule.tronAPI());
  gh.singleton<_i364.VeChainAPI>(() => registerModule.veChainAPI());
  gh.singleton<_i1011.XinFinAPI>(() => registerModule.xinfinAPI());
  gh.singleton<_i809.XRPAPI>(() => registerModule.xrpAPI());
  gh.singleton<_i20.VirtualAccountAPI>(
      () => registerModule.virtualAccountAPI());
  gh.singleton<_i963.BlockchainAddressesAPI>(
      () => registerModule.blockchainAddressesAPI());
  gh.singleton<_i670.BlockchainOperationsAPI>(
      () => registerModule.blockchainOperationAPI());
  gh.singleton<_i493.VirtualCustomerAPI>(
      () => registerModule.virtualCustomerAPI());
  gh.singleton<_i622.DepositAPI>(() => registerModule.depositAPI());
  gh.singleton<_i640.OrderBookAPI>(() => registerModule.orderBookAPI());
  gh.singleton<_i331.VirtualTransactionAPI>(
      () => registerModule.virtualTransactionAPI());
  gh.singleton<_i1020.VirtualCurrencyAPI>(
      () => registerModule.virtualCurrencyAPI());
  gh.singleton<_i580.WithdrawalAPI>(() => registerModule.withdrawalAPI());
  gh.singleton<_i1003.NetworkAuthInterceptor>(
      () => _i1003.NetworkAuthInterceptor());
  gh.singleton<_i183.CombiningSmartInterceptor>(() => registerModule
      .provideCombiningSmartInterceptor(gh<_i1003.NetworkAuthInterceptor>()));
  gh.singleton<_i361.Dio>(
      () => registerModule.provideDio(gh<_i183.CombiningSmartInterceptor>()));
  gh.singleton<_i1048.KuCoinService>(() => _i1048.KuCoinAPI(gh<_i361.Dio>()));
  gh.singleton<_i803.TronService>(() => _i803.TronAPI(gh<_i361.Dio>()));
  gh.singleton<_i881.HarmonyService>(() => _i881.HarmonyAPI(gh<_i361.Dio>()));
  gh.singleton<_i463.KlaytnService>(() => _i463.KlaytnAPI(gh<_i361.Dio>()));
  gh.singleton<_i809.XRPService>(() => _i809.XRPAPI(gh<_i361.Dio>()));
  gh.singleton<_i640.CeloService>(() => _i640.CeloAPI(gh<_i361.Dio>()));
  gh.singleton<_i640.VirtualOrderBookService>(
      () => _i640.OrderBookAPI(gh<_i361.Dio>()));
  gh.singleton<_i331.VirtualTransactionService>(
      () => _i331.VirtualTransactionAPI(gh<_i361.Dio>()));
  gh.singleton<_i493.VirtualCustomerService>(
      () => _i493.VirtualCustomerAPI(gh<_i361.Dio>()));
  gh.singleton<_i670.VirtualBcOperationsService>(
      () => _i670.BlockchainOperationsAPI(gh<_i361.Dio>()));
  gh.singleton<_i20.VirtualAccountService>(
      () => _i20.VirtualAccountAPI(gh<_i361.Dio>()));
  gh.singleton<_i591.DogeCoinService>(() => _i591.DogeCoinAPI(gh<_i361.Dio>()));
  gh.singleton<_i1040.EthereumService>(
      () => _i1040.EthereumAPI(gh<_i361.Dio>()));
  gh.singleton<_i397.ElrondService>(() => _i397.ElrondAPI(gh<_i361.Dio>()));
  gh.singleton<_i963.VirtualBcAddressService>(
      () => _i963.BlockchainAddressesAPI(gh<_i361.Dio>()));
  gh.singleton<_i962.BSCService>(() => _i962.BSCAPI(gh<_i361.Dio>()));
  gh.singleton<_i11.SolanaService>(() => _i11.SolanaAPI(gh<_i361.Dio>()));
  gh.singleton<_i622.VirtualDepositsService>(
      () => _i622.DepositAPI(gh<_i361.Dio>()));
  gh.singleton<_i849.BitcoinCashService>(
      () => _i849.BitcoinCashAPI(gh<_i361.Dio>()));
  gh.singleton<_i1020.VirtualCurrencyService>(
      () => _i1020.VirtualCurrencyAPI(gh<_i361.Dio>()));
  gh.singleton<_i642.PolygonService>(() => _i642.PolygonAPI(gh<_i361.Dio>()));
  gh.singleton<_i400.BBCService>(() => _i400.BBCAPI(gh<_i361.Dio>()));
  gh.singleton<_i364.VeChainService>(() => _i364.VeChainAPI(gh<_i361.Dio>()));
  gh.singleton<_i966.FlowService>(() => _i966.FlowAPI(gh<_i361.Dio>()));
  gh.singleton<_i421.StellarService>(() => _i421.StellarAPI(gh<_i361.Dio>()));
  gh.singleton<_i644.BitcoinService>(() => _i644.BitcoinAPI(gh<_i361.Dio>()));
  gh.singleton<_i580.VirtualWithdrawalService>(
      () => _i580.WithdrawalAPI(gh<_i361.Dio>()));
  gh.singleton<_i1011.XinFinService>(() => _i1011.XinFinAPI(gh<_i361.Dio>()));
  gh.singleton<_i902.AlgorandService>(() => _i902.AlgorandAPI(gh<_i361.Dio>()));
  gh.singleton<_i278.LitecoinService>(() => _i278.LitecoinAPI(gh<_i361.Dio>()));
  return getIt;
}

class _$RegisterModule extends _i1006.RegisterModule {}
