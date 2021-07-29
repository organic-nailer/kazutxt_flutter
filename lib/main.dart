import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
    if (_counter > 10) {
      saveFlag(true);
    }
  }

  void saveFlag(bool flag) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("FLAG", flag);
  }

  Future<bool> loadFlag() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("FLAG") ?? false;
  }

  void init() async {
    final flag = await loadFlag();
    if (flag) {
      setState(() {
        _counter = 100;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
                onPressed: () async {
                  final url = Uri.encodeFull("https://fastriver.dev");
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                icon: Icon(Icons.open_in_browser))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
