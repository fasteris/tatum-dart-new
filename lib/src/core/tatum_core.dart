import 'package:tatum/src/di/injectible.dart';
import 'package:tatum/src/services/algorand/tatum_algorand_api.dart';
import 'package:tatum/src/services/bitcoin/tatum_bitcoin_api.dart';

class Bitcoin {
  static BitcoinAPI api = getIt<BitcoinAPI>();
}

class Algorand {
  static AlgorandAPI api = getIt<AlgorandAPI>();
}
