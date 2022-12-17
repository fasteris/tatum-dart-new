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

class Bitcoin {
  static BitcoinAPI api = getIt<BitcoinAPI>();
}

class Algorand {
  static AlgorandAPI api = getIt<AlgorandAPI>();
}

class BitcoinCash {
  static BitcoinCashAPI api = getIt<BitcoinCashAPI>();
}

class BNBSmartChain {
  static BSCAPI api = getIt<BSCAPI>();
}

class BNBBeaconChain {
  static BBCAPI api = getIt<BBCAPI>();
}

class Celo {
  static CeloAPI api = getIt<CeloAPI>();
}

class DogeCoin {
  static DogeCoinAPI api = getIt<DogeCoinAPI>();
}

class Elrond {
  static ElrondAPI api = getIt<ElrondAPI>();
}

class Ethereum {
  static EthereumAPI api = getIt<EthereumAPI>();
}

class Flow {
  static FlowAPI api = getIt<FlowAPI>();
}

class Harmony {
  static HarmonyAPI api = getIt<HarmonyAPI>();
}

class Klaytn {
  static KlaytnAPI api = getIt<KlaytnAPI>();
}

class KuCoin {
  static KuCoinAPI api = getIt<KuCoinAPI>();
}

class Litecoin {
  static LitecoinAPI api = getIt<LitecoinAPI>();
}

class Polygon {
  static PolygonAPI api = getIt<PolygonAPI>();
}

class Solana {
  static SolanaAPI api = getIt<SolanaAPI>();
}

class Tron {
  static TronAPI api = getIt<TronAPI>();
}

class VeChain {
  static VeChainAPI api = getIt<VeChainAPI>();
}

class XinFin {
  static XinFinAPI api = getIt<XinFinAPI>();
}

class Ripple {
  static XRPAPI api = getIt<XRPAPI>();
}
