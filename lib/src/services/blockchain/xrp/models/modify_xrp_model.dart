import 'package:equatable/equatable.dart';

class ModifyXRPModel extends Equatable {
  final String fromAccount;
  final String fromSecret;
  final String? fee;
  final bool? rippling;
  final bool? requireDestinationTag;

  const ModifyXRPModel(
      {required this.fromAccount,
      required this.fromSecret,
      this.fee,
      this.rippling,
      this.requireDestinationTag});

  Map<String, dynamic> toJson() => {
        'fromAccount': fromAccount,
        'fromSecret': fromSecret,
        'fee': fee,
        'rippling': rippling,
        'requireDestinationTag': requireDestinationTag
      };

  @override
  List<Object?> get props =>
      [fromAccount, fromSecret, fee, rippling, requireDestinationTag];
}
