/**
 * /// Helper Functions ///
 */

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
 * The func will emit a numbers after 1s
 * and when number == 2 it will throw exception
 */
Stream<int> getNumbersException() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
    if (i == 2) throw Exception();
  }
}

/**
 * /// Methods on Stream ///
 */

void listen() {
  getNumbers().listen((event) => print(event));

  /// onDone
  int sum = 0;
  getNumbers().listen((data) => sum += data).onDone(() => print(sum));

  /// onError
  getNumbersException()
      .listen((event) => print(event))
      .onError((err) => print('An error occured'));
}

void awaitFor() async {
  int sum = 0;

  // Using await for to iterate wait till iteration over all
  // the stream is done
  await for (int number in getNumbers()) sum += number;

  print(sum);
}

void isEmpty() async {
  if (await getNumbers().isEmpty)
    print('Stream is empty');
  else
    print('Stream is not empty');
}

void first() async => print(await getNumbers().first);

void last() async => print(await getNumbers().last);

void length() async => print(await getNumbers().length);

// If stream emits more than single value then we'll get exception
void single() async => print(await getNumbers().single);

void any() async {
  if (await getNumbers().any((int i) => i == 3))
    print('There is a number equal to 3');
  else
    print('There is not a number equal to 3');
}

void contains() async {
  if (await getNumbers().contains(2))
    print('There is a number equal to 2');
  else
    print('There is not a number equal to 2');
}

void elementAt() async => print(await getNumbers().elementAt(2));

void firstWhere() async =>
    print(await getNumbers().firstWhere((int i) => i > 3));

void join() async => print(await getNumbers().join(', '));

void lastWhere() async => print(await getNumbers().lastWhere((int i) => i > 3));

void singleWhere() async =>
    print(await getNumbers().singleWhere((int i) => i <= 1));

void main() {
  listen();
  awaitFor();
  isEmpty();
  first();
  last();
  length();
  single();
  any();
  contains();
  elementAt();
  firstWhere();
  join();
  lastWhere();
  singleWhere();
}
