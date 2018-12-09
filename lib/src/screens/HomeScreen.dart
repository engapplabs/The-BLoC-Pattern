import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  StreamController<int> _counterController = new StreamController<int>();

  @override
  void dispose() {
    super.dispose();
    _counterController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            new StreamBuilder(
              stream: _counterController.stream,
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
        onPressed: () => _counterController.sink.add(++_counter),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
