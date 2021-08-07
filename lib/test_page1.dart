import 'package:flutter/material.dart';
import 'package:kazutxt_flutter/test_page2.dart';

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test1"),
      ),
      body: Center(
        child: TextButton(
          child: Text(
            "進む",
            style: TextStyle(fontSize: 80),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => TestPage2()));
          },
        ),
      ),
    );
  }
}
