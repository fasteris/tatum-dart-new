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
