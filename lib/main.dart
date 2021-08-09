import 'package:flutter/material.dart';
import 'package:kazutxt_flutter/my_data.dart';
import 'package:kazutxt_flutter/slider.dart';
import 'package:kazutxt_flutter/widget_a.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyData(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<MyData>(
                builder: (_, myData, __) => Text(
                  myData.value.toStringAsFixed(2),
                  style: TextStyle(fontSize: 100),
                ),
              ),
              MySlider()
            ],
          )),
    );
  }
}
