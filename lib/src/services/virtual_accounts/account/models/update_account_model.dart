import 'package:equatable/equatable.dart';

class UpdateAccountModel extends Equatable {
  
  final String? accountCode;
  final String? accountNumber;

  const UpdateAccountModel({
      this.accountCode,
      this.accountNumber});

  Map<String, dynamic> toJson() => {
        'accountCode': accountCode,
        'accountNumber': accountNumber
      };

  @override
  List<Object?> get props => [
        accountCode,
        accountNumber
      ];
}
