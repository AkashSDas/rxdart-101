/**
 * /// Helper Functions ///
 */

Stream<int> getNumbers() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

Stream<int> getNumbersException() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
    if (i == 2) throw Exception();
  }
}

Stream<int> getNumbersTimeout() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 3));
  }
}

void handleError() =>
    getNumbersException().handleError((err) => print(err)).listen(print);

void timeout() {
  // getNumbersTimeout().timeout(Duration(seconds: 3)).listen(print);
  getNumbersTimeout().timeout(Duration(seconds: 4)).listen(print);
}

void main() {
  handleError();
  timeout();
}
