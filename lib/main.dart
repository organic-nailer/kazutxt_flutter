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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool _flag = false;

  void _click() {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 3),
              width: _flag ? 100 : 50,
              height: _flag ? 50 : 100,
              padding: _flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
              margin: _flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
              transform: _flag ? Matrix4.skewX(0) : Matrix4.skewX(0.3),
              color: _flag ? Colors.blue : Colors.grey,
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 3),
              child: _flag
                  ? Text("なにもない")
                  : Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
