import 'package:flutter/material.dart';
import 'dart:math' as Math;

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
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      StatefulTile(
        key: UniqueKey(),
      ),
      StatefulTile(
        key: UniqueKey(),
      ),
    ];
  }

  void changeTiles() {
    setState(() {
      tiles = tiles.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeTiles,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class StatefulTile extends StatefulWidget {
  StatefulTile({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StatefulTileState();
}

class _StatefulTileState extends State<StatefulTile> {
  Color _color = Colors.black;
  var _random = Math.Random();

  @override
  void initState() {
    super.initState();
    _color = Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
      color: _color,
      height: 100,
      width: 100,
    );
  }
}
