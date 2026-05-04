import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/bloc/auth_bloc.dart';
import 'router/router.dart';

void main() {
  final authBloc = AuthBloc();

  runApp(
    BlocProvider.value(
      value: authBloc,
      child: MyApp(router: createRouter(authBloc)),
    ),
  );
}

class MyApp extends StatelessWidget {
  final router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
