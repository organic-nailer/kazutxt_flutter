import 'dart:io';

class Async {
  void asyncTest1() {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(syncFunc("data1", 3));
    print("data2 start");
    print(syncFunc("data2", 2));
    print("data3 start");
    print(syncFunc("data3", 1));
  }

  String syncFunc(String name, int time) {
    sleep(Duration(seconds: time));
    return name + ":" + DateTime.now().toString();
  }

  void asyncTest2() {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    var result1 = asyncFunc("data1", 3);
    result1.then((result) {
      print(result);
    });
    print("data2 start");
    var result2 = asyncFunc("data2", 2);
    result2.then((result) {
      print(result);
    });
    print("data3 start");
    var result3 = asyncFunc("data3", 1);
    result3.then((result) {
      print(result);
    });
  }

  void asyncTest4() async {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(await asyncFunc("data1", 3));
    print("data2 start");
    print(await asyncFunc("data2", 2));
    print("data3 start");
    print(await asyncFunc("data3", 1));
  }

  Future<String> asyncFunc(String name, int time) async {
    return Future.delayed(Duration(seconds: time), () {
      return name + ":" + DateTime.now().toString();
    });
  }
}
