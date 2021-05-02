/**
 * async == Future
 * async* == Stream
 */

/**
 * The func will emit a numbers after 1s
 */
Stream<int> getNumbers() async* {
  for (int i = 1; i <= 10; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  /// Subscribing to Stream
  getNumbers().listen((data) {
    print(data);
  });
}
