/**
 * The func will emit a numbers after 1s
 */
Stream<int> getNumbers() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

/**
 * The func will emit duplicate numbers after 1s
 */
Stream<int> getNumbersDuplicates() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void expand() => getNumbers()
    // the elements in the list will be emitted
    // as separate pieces of data
    .expand((data) => [data, data * 10])
    .listen((item) => print(item));

void map() {
  getNumbers().map((int i) => i * 10).listen((data) => print(data));
  getNumbers().map((int i) => i).listen((data) => print(data));
}

void skip() => getNumbers().skip(2).listen((data) => print(data));

void skipWhile() =>
    getNumbers().skipWhile((i) => i < 2).listen((data) => print(data));

void take() => getNumbers().take(2).listen((data) => print(data));

void takeWhile() =>
    getNumbers().takeWhile((i) => i < 2).listen((data) => print(data));

void where() => getNumbers().where((i) => i < 2).listen((data) => print(data));

/**
 * In takeWhile, once the condition is broken it stops checking
 * but in where it checks for all values
 */

void distinct() =>
    getNumbersDuplicates().distinct().listen((data) => print(data));

void chaining() => getNumbersDuplicates()
    .distinct()
    .map((item) => item * 10)
    .where((item) => item != 20)
    .listen((data) => print(data));

void main() {
  expand();
  map();
  skip();
  skipWhile();
  take();
  takeWhile();
  where();
  distinct();
  chaining();
}
