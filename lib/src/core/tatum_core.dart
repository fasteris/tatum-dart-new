import 'package:tatum/src/di/injectible.dart';
import 'package:tatum/src/services/blockchain/algorand/tatum_algorand_api.dart';
import 'package:tatum/src/services/blockchain/bitcoin/tatum_bitcoin_api.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/tatum_bsc_api.dart';

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
