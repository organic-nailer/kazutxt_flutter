import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kazutxt_flutter/my_data.dart';

final _myDataProvider =
    StateNotifierProvider<MyData, double>((ref) => MyData());

void main() {
  runApp(ProviderScope(child: MyApp()));
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, watch, child) => Text(
                watch(_myDataProvider).toStringAsFixed(2),
                style: TextStyle(fontSize: 100),
              ),
            ),
            Consumer(
              builder: (context, watch, child) {
                return Slider(
                  value: watch(_myDataProvider),
                  onChanged: (value) =>
                      context.read(_myDataProvider.notifier).changeState(value),
                );
              },
            )
          ],
        ));
  }
}
