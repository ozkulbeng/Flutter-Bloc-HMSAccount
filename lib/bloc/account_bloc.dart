import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_account/huawei_account.dart';

import '../data/account_repository.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;

  AccountBloc(AccountState initialState, this.accountRepository)
      : super(initialState) {
    print("Bloc initialized.");
  }

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is LaunchEvent) {
      yield* _mapLaunchEventToState();
    } else if (event is SignInEvent) {
      yield* _mapSignedInEventToState();
    } else if (event is SignOutEvent) {
      yield* _mapSignedOutEventToState();
    }
  }

  Stream<AccountState> _mapLaunchEventToState() async* {
    try {
      bool isAuthenticated = await accountRepository.isAuthenticated();
      print(isAuthenticated);
      if (isAuthenticated) {
        Account account = await accountRepository.getAccount();
        yield AuthenticatedState(account);
      } else {
        yield UnauthenticatedState();
      }
    } catch (_) {
      yield UnknownState();
    }
  }

  Stream<AccountState> _mapSignedInEventToState() async* {
    accountRepository.signIn();
    Account account = await accountRepository.getAccount();
    yield AuthenticatedState(account);
  }

  Stream<AccountState> _mapSignedOutEventToState() async* {
    accountRepository.signOut();
    yield UnauthenticatedState();
  }
}
