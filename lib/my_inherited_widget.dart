import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  final int count;

  MyInheritedWidget({required this.count, required Widget child})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
          as MyInheritedWidget;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
      oldWidget.count != count && count % 2 == 0;
}
