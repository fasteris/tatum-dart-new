import 'package:equatable/equatable.dart';

class GeneratePrivateKeyModel extends Equatable {
  final int index;
  final String mnemonic;

  const GeneratePrivateKeyModel({required this.index, required this.mnemonic});

  Map<String, dynamic> toJson() => {'index': index, 'mnemonic': mnemonic};

  @override
  List<Object?> get props => [index, mnemonic];
}
