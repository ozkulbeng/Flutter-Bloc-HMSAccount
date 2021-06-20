import 'package:bloc_account/bloc/account_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/account_bloc.dart';
import 'bloc/account_state.dart';
import 'data/account_repository.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AccountRepository _repository = AccountRepository();
  AccountBloc _accountBloc;

  @override
  void initState() {
    _accountBloc = AccountBloc(UnknownState(), _repository);
    _accountBloc.add(LaunchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: BlocProvider(
      lazy: false,
      create: (_) => _accountBloc,
      child: HomePage(),
    ));
  }
}
