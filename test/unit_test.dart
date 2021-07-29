import 'package:flutter_test/flutter_test.dart';
import 'package:kazutxt_flutter/calc.dart';

void main() {
  test("mytest1", () {
    var ans = 10;
    expect(ans, 10);
  });

  test("mytest2", () {
    var p1 = 10;
    var p2 = 20;
    var calc = Calc();
    var ans = calc.add(p1, p2);

    expect(ans, 30);
  });
}
