import 'package:equatable/equatable.dart';
import 'package:huawei_account/huawei_account.dart';

abstract class AccountState extends Equatable {}

class AuthenticatedState extends AccountState {
  final Account account;

  AuthenticatedState(this.account);

  @override
  String toString() => "Welcome ${account.name}!";

  @override
  List<Object> get props => [account];
}

class UnauthenticatedState extends AccountState {
  @override
  String toString() => "Signed Out successfully.";

  @override
  List<Object> get props => [];
}

class UnknownState extends AccountState {
  @override
  String toString() => "Unknown State";

  @override
  List<Object> get props => [];
}
