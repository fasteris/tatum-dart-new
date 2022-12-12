import 'package:equatable/equatable.dart';

class GeneratePrivateKeyModel extends Equatable {
  final int index;
  final String mnemonics;

  const GeneratePrivateKeyModel({required this.index, required this.mnemonics});

  Map<String, dynamic> toJson() => {'index': index, 'mnemonics': mnemonics};

  @override
  List<Object?> get props => [index, mnemonics];
}
