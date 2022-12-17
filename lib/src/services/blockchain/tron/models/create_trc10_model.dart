import 'package:equatable/equatable.dart';

class CreateTRC10Model extends Equatable {
  final String fromPrivateKey;
  final String recipient;
  final String name;
  final String abbreviation;
  final String description;
  final String url;
  final int totalSupply;
  final int decimals;

  const CreateTRC10Model({
    required this.fromPrivateKey,
    required this.recipient,
    required this.name,
    required this.abbreviation,
    required this.description,
    required this.url,
    required this.decimals,
    required this.totalSupply,
  });

  Map<String, dynamic> toJson() => {
        'fromPrivateKey': fromPrivateKey,
        'recipient': recipient,
        'name': name,
        'abbreviation': abbreviation,
        'description': description,
        'url': url,
        'totalSupply': totalSupply,
        'decimals': decimals
      };

  @override
  List<Object?> get props => [
        fromPrivateKey,
        recipient,
        name,
        abbreviation,
        description,
        url,
        totalSupply,
        decimals
      ];
}
