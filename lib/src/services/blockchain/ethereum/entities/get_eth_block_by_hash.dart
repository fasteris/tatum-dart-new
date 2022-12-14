import 'package:tatum/src/services/blockchain/bnb_beacon_chain/entities/transaction_entity.dart';
import 'package:tatum/src/services/blockchain/bnb_smart_chain/entities/get_bsc_block_by_hash_response.dart';

class GetEthereumBlockByHashResponse extends GetBSCBlockByHashResponse {
  GetEthereumBlockByHashResponse(
      {required super.difficulty,
      required super.extraData,
      required super.gasLimit,
      required super.gasUsed,
      required super.hash,
      required super.logsBloom,
      required super.miner,
      required super.mixHash,
      required super.nonce,
      required super.number,
      required super.parentHash,
      required super.receiptsRoot,
      required super.sha3Uncles,
      required super.size,
      required super.stateRoot,
      required super.timeStamp,
      required super.totalDifficulty,
      required super.transactions,
      required super.transactionsRoot});

  static fromJson(Map<String, dynamic> json) => GetBSCBlockByHashResponse(
        difficulty: json['difficulty'] as String,
        extraData: json['extraData'] as String,
        gasLimit: json['gasLimit'] as int,
        gasUsed: json['gasUsed'] as int,
        hash: json['hash'] as String,
        logsBloom: json['logsBloom'] as String,
        miner: json['miner'] as String,
        mixHash: json['mixHash'] as String,
        nonce: json['nonce'] as String,
        number: json['number'] as int,
        parentHash: json['parentHash'] as String,
        receiptsRoot: json['receiptsRoot'] as String,
        sha3Uncles: json['sha3Uncles'] as String,
        size: json['size'] as int,
        stateRoot: json['stateRoot'] as String,
        timeStamp: json['timeStamp'] as int,
        totalDifficulty: json['totalDifficulty'] as String,
        transactionsRoot: json['transactionsRoot'] as String,
        transactions: [],
      );
}
