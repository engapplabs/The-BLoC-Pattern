import 'package:flutter/material.dart';
import 'package:the_bloc_pattern/Blocs/CounterBloc.dart';
import 'package:the_bloc_pattern/src/interface/BlocProvider.dart';
import 'package:the_bloc_pattern/src/screens/BlocHomeScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          bloc: CounterBloc(),
          child: BlocHomePage(),
        ));
  }
}
