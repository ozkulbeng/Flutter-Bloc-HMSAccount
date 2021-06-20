import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_account/huawei_account.dart';

import '../bloc/account_bloc.dart';
import '../bloc/account_event.dart';
import '../bloc/account_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (_, state) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                state is AuthenticatedState
                    ? RaisedButton(
                        child: Text("Sign Out"),
                        onPressed: () =>
                            context.read<AccountBloc>().add(SignOutEvent()),
                      )
                    : HuaweiIdAuthButton(
                        onPressed: () =>
                            context.read<AccountBloc>().add(SignInEvent()))
              ],
            ),
          );
        },
      ),
    );
  }
}
