import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyInheritedWidget extends InheritedWidget {
  final String message;

  MyInheritedWidget({required this.message, required Widget child})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
          as MyInheritedWidget;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
      oldWidget.message != message;
}
