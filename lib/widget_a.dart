import 'package:flutter/material.dart';
import 'package:kazutxt_flutter/my_inherited_widget.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyInheritedWidget _inherited = MyInheritedWidget.of(context);
    return Text("${_inherited.count}");
  }
}
