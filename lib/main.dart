import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
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
        body: MyContents());
  }
}

class MyContents extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _value = useProvider(_myDataProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _value.toStringAsFixed(2),
          style: TextStyle(fontSize: 100),
        ),
        Slider(
          value: _value,
          onChanged: (value) =>
              context.read(_myDataProvider.notifier).changeState(value),
        )
      ],
    );
  }
}
