import 'dart:math' as Math;
import 'dart:async';

class Generator {
  var rand;
  late StreamController<int> intStream;
  void init(StreamController<int> stream) {
    rand = new Math.Random();
    intStream = stream;
  }

  void generate() {
    var data = rand.nextInt(100);
    print("generatorが$data を作ったよ");
    intStream.sink.add(data);
  }
}

class Coordinator {
  late StreamController<int> intStream;
  late StreamController<String> strStream;
  void init(
      StreamController<int> intStream, StreamController<String> strStream) {
    this.intStream = intStream;
    this.strStream = strStream;
  }

  void coordinate() {
    intStream.stream.listen((data) {
      var newData = data.toString() + ".0";
      print("coordinatorが$dataから$newDataに変換したよ");
      strStream.sink.add(newData);
    });
  }
}

class Consumer {
  late StreamController<String> strStream;
  void init(StreamController<String> stream) {
    strStream = stream;
  }

  consume() {
    strStream.stream.listen((data) {
      print("consumerが$dataを使ったよ");
    });
  }
}
