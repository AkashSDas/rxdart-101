import 'dart:async';

// StreamController<String> _ctrl = StreamController<String>();

// Using broadcast to listem to individual stream multiple times
StreamController<String> _ctrl = StreamController<String>.broadcast();

Stream<String> get out => _ctrl.stream;

void main() {
  out.listen((data) => print(data));
  add();

  out.listen((data) => print(data.replaceAll('a', 'b')));
  add();
}

void add() => _ctrl.sink.add('somedata');
