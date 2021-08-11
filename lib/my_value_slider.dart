import 'package:flutter/material.dart';
import 'package:kazutxt_flutter/my_value.dart';
import 'package:provider/provider.dart';

class MyValueSlider extends StatefulWidget {
  const MyValueSlider({Key? key}) : super(key: key);

  @override
  _MyValueSliderState createState() => _MyValueSliderState();
}

class _MyValueSliderState extends State<MyValueSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
        value: context.select((MyValue myValue) => myValue.value),
        onChanged: (newValue) =>
            {context.read<MyValueStateNotifier>().change(newValue)});
  }
}
