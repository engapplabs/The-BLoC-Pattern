import 'package:flutter/material.dart';
import 'package:the_bloc_pattern/Blocs/CounterBloc.dart';
import 'package:the_bloc_pattern/src/interface/BlocProvider.dart';

class BlocHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Pattern'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            new StreamBuilder(
              stream: _counterBloc.outCounter,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return new Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterBloc.incrementCounter.add(null);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
