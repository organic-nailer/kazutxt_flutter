import 'package:flutter/material.dart';
import 'package:kazutxt_flutter/my_data.dart';
import 'package:provider/provider.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyData>(context);
    return Slider(
        value: myData.value, onChanged: (value) => myData.value = value);
  }
}
