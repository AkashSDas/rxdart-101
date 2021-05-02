# rxdart-101

**Reactive programming** is just programming with asynchronus `data stream`. Data stream is an object that emit multiple piece of data over the dimension of time. Depending on the different language this data stream can get different names, like in Dart they called as **Stream<T>** while in **Rx** libaries like **RxJS**, **RxJava**, **RxDart** they are called as **Observable<T>**.

```text
v == value

time ----1s----2s----3s----4s----5s----6s
data ----v1-------v2----v3---------v4----
```

This is exactly similar to **Futures**, but futures can provide data only a single result while **Streams** can provide you multiple results.
