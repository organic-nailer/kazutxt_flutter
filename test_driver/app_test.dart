import 'dart:math';

import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group("Counter App", () {
    final counterTextFinder = find.byValueKey("counter");
    final buttonFinder = find.byValueKey("increment");
    late FlutterDriver driver;

    //すべてのテスト前に実行
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    //すべてのテスト後に実行
    tearDownAll(() async {
      driver.close();
    });

    test("カウンターが0から始まっている", () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test("カウンタを増やす", () async {
      await driver.tap(buttonFinder);

      expect(await driver.getText(counterTextFinder), "1");
    });
  });
}
