import 'package:first_app/bloc/counter.bloc.dart';
import 'package:first_app/bloc/theme.bloc.dart';
import 'package:first_app/bloc/users.bloc.dart';
import 'package:first_app/ui/pages/counter.bloc.page.dart';
import 'package:first_app/ui/pages/counter.stateful.page.dart';
import 'package:first_app/ui/pages/git.users.page.dart';
import 'package:first_app/ui/pages/home.page.dart';
import 'package:first_app/ui/pages/root.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>CounterBloc()),
          BlocProvider(create: (context)=>ThemeBloc()),
          BlocProvider(create: (context)=>UsersBloc()),
        ],
        child: const RootView()
    );
  }
}








