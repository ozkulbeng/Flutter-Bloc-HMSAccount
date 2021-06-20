import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class LaunchEvent extends AccountEvent {}

class SignInEvent extends AccountEvent {}

class SignOutEvent extends AccountEvent {}
