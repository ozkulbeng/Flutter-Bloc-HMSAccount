import 'package:huawei_account/huawei_account.dart';
import 'dart:async';

enum AccountStatus { UNKNOWN, SIGNED_IN, SIGNED_OUT }

class AccountRepository {
  // Obtains the Intent object of the ID authorization screen.
  Future<Account> signIn() async {
    AccountAuthParamsHelper helper = AccountAuthParamsHelper();
    AuthAccount authAccount = await AccountAuthService.signIn(helper);
    return authAccount.account;
  }

  //Signs out of the current ID.
  // The account SDK deletes the cached ID information.
  Future<bool> signOut() async {
    bool result = await AccountAuthService.signOut();
    return result;
  }

  Future<Account> getAccount() async {
    return (await AccountAuthManager.getAuthResult()).account;
  }

  Future<bool> isAuthenticated() async {
    AuthAccount account = await AccountAuthManager.getAuthResult();
    return account == null ? false : true;
  }
}
