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
  late AnimationController _controller;

  void _play() {
    _controller.forward();
  }

  void _stop() {
    _controller.stop();
  }

  void _reverse() {
    _controller.reverse();
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              SizeTransition(
                sizeFactor: _controller,
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: _play,
              child: Icon(Icons.arrow_forward),
            ),
            FloatingActionButton(
              onPressed: _stop,
              child: Icon(Icons.pause),
            ),
            FloatingActionButton(
              onPressed: _reverse,
              child: Icon(Icons.arrow_back),
            ),
          ],
        ));
  }
}
