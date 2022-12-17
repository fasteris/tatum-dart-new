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

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

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
Tatum supports 2 chains:

Mainnet - a regular live chain
Testnet - a chain used for testing purposes. Coins on the test chain have no value and can be obtained from a faucet, e.g. https://bank.testnet.algorand.network/

- [API documentation](https://apidoc.tatum.io/tag/Algorand)

#### Bitcoin API

Bitcoin Blockchain enables access to the most commonly used Bitcoin methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.
Tatum supports 2 chains:

Mainnet - a regular live chain
Testnet3 - a chain used for testing purposes. Coins on the test chain have no value and can be obtained from a faucet, e.g. https://testnet-faucet.mempool.co/

- [API documentation](https://apidoc.tatum.io/tag/Bitcoin)

#### Bitcoin Cash

Bitcoin Cash Blockchain enables access to the most commonly used Bitcoin Cash methods. These methods bring a small level of abstraction and are used for applications that communicate with the blockchain directly. Some of the methods are used alongside Tatum Private Ledger to connect the blockchain and the private ledger, like wallet generation or getting information about transactions.
Tatum supports 2 chains:

Mainnet - a regular live chain
Testnet - a chain used for testing purposes. Coins on the test chain have no value and can be obtained from a faucet, e.g. https://faucet.fullstack.cash/
Tatum supports BIP44 HD wallets. Because they can generate 2^31 addresses from 1 mnemonic phrase, they are very convenient and secure. It is possible to generate this type of wallet with 1 simple API call.

- [API documentation](https://apidoc.tatum.io/tag/Bitcoin-Cash)