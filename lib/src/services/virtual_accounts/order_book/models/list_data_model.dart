import 'package:equatable/equatable.dart';

class ListDataModel extends Equatable {
  final String? id;
  final String? customerId;
  final num pageSize;
  final num? offset;
  final String? pair;
  final bool? count;
  final List<String>? types;
  final List<String>? type;
  final List<String>? amount;
  final List<String>? fill;
  final List<String>? price;
  final List<String>? created;
  final List<String>? sort;
  final String? tradeType;

  const ListDataModel(
      {required this.pageSize,
      this.amount,
      this.count,
      this.created,
      this.customerId,
      this.fill,
      this.id,
      this.offset,
      this.pair,
      this.price,
      this.sort,
      this.types,
      this.type,
      this.tradeType});

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'id': id,
        'customerId': customerId,
        'pageSize': pageSize,
        'offset': offset,
        'pair': pair,
        'count': count,
        'types': types,
        'fill': fill,
        'price': price,
        'created': created,
        'sort': sort,
        'tradeType': tradeType,
        'type': type
      };

  @override
  List<Object?> get props => [
        amount,
        id,
        customerId,
        pageSize,
        offset,
        pair,
        count,
        types,
        fill,
        price,
        created,
        sort,
        tradeType,
        type
      ];
}
