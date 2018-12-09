import 'dart:async';
import 'package:the_bloc_pattern/src/interface/BlocProvider.dart';

class CounterBloc implements BlocBase {
  int _counter = 0;

  //Streams criada para cuidar do contador
  StreamController<int> _counterController = new StreamController<int>();
  Sink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  //Streams para cuidar do incremento do contador
  StreamController<int> _incrementController = new StreamController<int>();
  Sink<int> get incrementCounter => _incrementController.sink;

  CounterBloc() {
    _counter = 0;
    _incrementController.stream.listen(_increment);
  }
  @override
  void dispose() {
    _counterController.close();
    _incrementController.close();
  }

  void _increment(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }
}
