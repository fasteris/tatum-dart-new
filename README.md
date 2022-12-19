<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Tatum APIs

Generated Dart libraries for accessing Tatum APIs.

![tatum flutter](https://firebasestorage.googleapis.com/v0/b/vaultwallet-8835f.appspot.com/o/blockchain-images%2Ftatum-flutter.png?alt=media&token=578e97ad-1d8b-4bdb-aa69-b019ae998b16)

## Getting started

To get started copy: `tatum: ^1.0.4` paste into your `pubspec.yaml` and run `flutter pub get`

Then import
```dart
import 'package:tatum/tatum.dart'
```

## Usage

To use, simple add inside `main()` function before `runApp` if using flutter.

```dart
Tatum.initArchitecture();
```
then instanciate by doing this:

```dart
final tatum = Tatum.instance;
```
OR
```dart
final tatum = Tatum.v3;
```
Then set api key;
```dart
tatum.setKey('your-api-key');
```
An example call
```dart
final bitcoin = tatum.bitcoin;
final wallet = await bitcoin.generateWallet();
final address = await bitcoin.generateAddress(xpub: wallet.xpub, index: 1);
```
That simple.

## Additional information

Generated Dart libraries for accessing
[Tatum APIs](https://docs.tatum.io/).

To use these APIs from Flutter, see the
[Generic Tatum APIs documentation](https://apidoc.tatum.io/).

For example of using these APIs from a Dart console example see the example in
this package. For an example of usage in a server application,
[see this example](https://github.com/samuelezedi/tatum-dart/tree/main/example).

## Available Tatum APIs

The following is a list of APIs that are currently available inside this
package.

### Blockchain

#### Algorand API

Algorand is a decentralized blockchain technology network. Algorand is enabling the simple creation of next generation financial products, protocols and exchange of value across defi, financial institutions and governments.

```dart
final algorand = tatum.algorand;
final wallet = await algorand.generateWallet();
```
- [API documentation](https://apidoc.tatum.io/tag/Algorand)

#### Bitcoin API

Bitcoin Blockchain enables access to the most commonly used Bitcoin methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.

```dart
final bitcoin = tatum.bitcoin;
final wallet = await bitcoin.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Bitcoin)

#### Bitcoin Cash

Bitcoin Cash Blockchain enables access to the most commonly used Bitcoin Cash methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.
Tatum supports 2 chains:

```dart
final bCash = tatum.bCash;
final wallet = await bCash.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Bitcoin-Cash)

#### BNB Smart Chain

Binance Smart Chain is an Ethereum EVM 100% compatible blockchain, and is very good for decentralized application (Dapp) development within many possible verticals including DeFi, NFT, Gaming, and many others.
Tatum supports 2 chains:

```dart
final bsc = tatum.bsc;
final wallet = await bsc.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/BNB-Smart-Chain)

#### BNB Beacon Chain

BNB Beacon Chain is a blockchain developed by Binance. With Tatum, you can access the most commonly used BNB Beacon Chain methods. These methods bring a certain level of abstraction and are used for applications that communicate with the blockchain directly.

```dart
final bbc = tatum.bbc;
final wallet = await bbc.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/BNB-Beacon-Chain)

#### Celo

Celo is fork of Celo with more than 1000 tps and possibility to pay for transactions in it's own stable coin, cUSD. Celo Blockchain enables access to most commonly used Celo methods. These methods bring small level of abstraction, and are used for the type of applications that want to communicate with blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect blockchain and private ledger together, like wallet generation or getting information about transactions.

```dart
final celo = tatum.celo;
final wallet = await celo.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Celo)

#### Dogecoin

Dogecoin Blockchain enables access to the most commonly used Dogecoin methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.

```dart
final dc = tatum.dogecoin;
final wallet = await dc.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Dogecoin)


#### Elrond

Elrond (EGLD) is a distributed transactional computation protocol which relies on a sharded state architecture and a secure Proof of Stake consensus mechanism.

```dart
final elron = tatum.elrond;
final wallet = await elrond.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Elrond)

#### Ethereum

Ethereum is a decentralized, open-source blockchain. With Tatum, you can access the most commonly used Ethereum methods. These methods bring a certain level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside virtual accounts to connect the blockchain and a virtual account, like generating a wallet or getting information about transactions.

```dart
final eth = tatum.ethereum;
final wallet = await eth.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Ethereum)

#### Flow

Flow Blockchain enables access to the most commonly used Flow methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.

```dart
final flow = tatum.flow;
final wallet = await flow.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Flow)

#### Harmony

Harmony.ONE is an Oneeum L2 scaling solution 100% EVM compatible, and is very good for decentralized application (Dapp) development within many possible verticals including DeFi, NFT, Gaming, and many others.

```dart
final one = tatum.harmoney;
final wallet = await one.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Harmony)

#### Klaytn

Klaytn is an Ethereum EVM 100% compatible blockchain, and is very good for decentralized application (Dapp) development within many possible verticals including DeFi, NFT, Gaming, and many others.

```dart
final klaytn = tatum.klaytn;
final wallet = await klaytn.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Klaytn)

#### KuCoin

Kcs (KCS) is an Ethereum EVM 100% compatible blockchain, and is very good for decentralized application (Dapp) development within many possible verticals including DeFi, NFT, Gaming, and many others.

```dart
final kucoin = tatum.kucoin;
final wallet = await kucoin.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/KuCoin)


#### Litecoin

Litecoin Blockchain enables access to the most commonly used Litecoin methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.
```dart
final ltc = tatum.litecoin;
final wallet = await ltc.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Litecoin)

#### Polygon

Polygon (Matic) is an Ethereum EVM 100% compatible blockchain, and is very good for decentralized application (Dapp) development within many possible verticals including DeFi, NFT, Gaming, and many others.

```dart
final matic = tatum.polygon;
final wallet = await matic.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Polygon)

#### Solana

Solana is a blockchain network focused on fast transactions and high throughput. It uses a unique method of ordering transactions to improve its speed. Users can pay their transaction fees and interact with smart contracts with SOL, the network's native cryptocurrency.

```dart
final sol = tatum.solana;
final wallet = await sol.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Solana)

#### Stellar

XLM Blockchain enables access to the most commonly used XLM methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.

```dart
final xlm = tatum.stellar;
final wallet = await xlm.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Stellar)

#### Tron

Tron Blockchain enables access to most commonly used Tron methods. It's possible to generate TRON account, send TRX, TRC10 and TRC20 assets. It's also possible to generate custom TRC10 or TRC20 tokens using API.

```dart
final tron = tatum.tron;
final wallet = await tron.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/Tron)

#### VeChain

VeChain Blockchain enables access to the most commonly used VeChain methods. Tatum does not support off-chain capabilities for the VET blockchain. Tatum KMS is not supported for VET transactions. VET supports 2 native assets - VET and VTHO. VTHO is used for paying transaction fees.

```dart
final ve = tatum.vechain;
final wallet = await ve.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/VeChain)

#### XinFin

XDC Network (XinFin) is enterprise ready hybrid blockchain for global trade and finance, combining the power of Public & Private blockchains with interoperable Smart Contracts.

```dart
final xf = tatum.xinfin;
final wallet = await xf.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/XinFin)

#### Ripple

XRP Blockchain enables access to the most commonly used XRP methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.

```dart
final xrp = tatum.ripple;
final wallet = await xrp.generateWallet();
```

- [API documentation](https://apidoc.tatum.io/tag/XRP)

Kindly follow on [Github](https://github.com/samuelezedi)
And
Kindly follow on [Twitter](https://twitter.com/coderegent)

