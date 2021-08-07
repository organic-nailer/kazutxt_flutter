import 'package:flutter/material.dart';
import 'package:kazutxt_flutter/test_page3.dart';

class TestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                "進む",
                style: TextStyle(fontSize: 80),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/test3");
              },
            ),
            TextButton(
              child: Text(
                "戻る",
                style: TextStyle(fontSize: 80),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
