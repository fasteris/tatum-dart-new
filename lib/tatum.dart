library tatum;

import 'package:tatum/src/core/tatum_core.dart';
import 'package:tatum/src/di/injectible.dart';
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
export 'src/core/tatum_exports.dart';

/// A Tatum.
class Tatum {
  static String _apiKey = 'api-key-string';

  Tatum._privateConstructor();

  static final Tatum _instance = Tatum._privateConstructor();

  static final Tatum _v3 = Tatum._privateConstructor();

  static Tatum get instance => _instance;

  static Tatum get v3 => _v3;

  static void initArchitecture() async => await configureDependencies();

  void setKey(String key) => _apiKey = key;

  String getApiKey() => _apiKey.toString();

  void printKey() => print(_apiKey.toString());

  BitcoinAPI bitcoin = Bitcoin.api;

  AlgorandAPI algorand = Algorand.api;

  BitcoinCashAPI bcash = BitcoinCash.api;

  BSCAPI bnbSmartChain = BNBSmartChain.api;

  BBCAPI bnbBeaconChain = BNBBeaconChain.api;

  CeloAPI celo = Celo.api;

  DogeCoinAPI dogecoin = DogeCoin.api;

  ElrondAPI elrond = Elrond.api;

  EthereumAPI ethereum = Ethereum.api;

  FlowAPI flow = Flow.api;

  HarmonyAPI harmony = Harmony.api;

  KlaytnAPI klaytn = Klaytn.api;

  KuCoinAPI kucoin = KuCoin.api;

  LitecoinAPI litecoin = Litecoin.api;

  PolygonAPI polygon = Polygon.api;

  SolanaAPI solana = Solana.api;

  TronAPI tron = Tron.api;

  VeChainAPI vechain = VeChain.api;

  XinFinAPI xinfin = XinFin.api;

  XRPAPI ripple = Ripple.api;

  VirtualAccountAPI account = VAaccount.api;
}
