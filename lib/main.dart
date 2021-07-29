import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.create),
            Text("初めてのタイトル"),
          ],
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Text("Drawer"),
        ),
      ),
      body: Column(
        children: [
          Text("初めてのテキスト"),
          Text("2番目のテキスト"),
          TextButton(
            onPressed: () {
              print("ボタンが押されたよ");
            },
            child: Text("更新"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 30,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("押したね？");
        },
        child: Icon(Icons.timer),
      ),
    );
  }
}
