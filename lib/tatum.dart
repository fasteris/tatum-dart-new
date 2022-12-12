library tatum;

import 'package:tatum/src/core/tatum_core.dart';
import 'package:tatum/src/di/injectible.dart';
import 'package:tatum/src/services/blockchain/algorand/tatum_algorand_api.dart';
import 'package:tatum/src/services/blockchain/bitcoin/tatum_bitcoin_api.dart';
import 'package:tatum/src/services/blockchain/bitcoin_cash/tatum_bitcoin_cash_api.dart';

/// A Tatum.
class Tatum {
  static String _apiKey = 'api-key-string';

  Tatum._privateConstructor();

  static final Tatum _instance = Tatum._privateConstructor();

  static Tatum get instance => _instance;

  static void config() async {
    await configureDependencies();
  }

  void setKey(String key) async {
    _apiKey = key;
  }

  String getApiKey() => _apiKey.toString();

  void printKey() => print(_apiKey.toString());

  BitcoinAPI bitcoin = Bitcoin.api;

  AlgorandAPI algorand = Algorand.api;

  BitcoinCashAPI bcash = BitcoinCash.api;
}
