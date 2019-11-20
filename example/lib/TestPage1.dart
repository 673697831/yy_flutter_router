import 'dart:math';

import 'package:flutter/material.dart';
import 'TestPage2.dart';

class TestPage1 extends StatefulWidget {
  final String text;

  TestPage1({this.text});

  @override
  _TestPage1State createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  String text = "123";

  @override
  void initState() {
    super.initState();
    // v();
  }

  void v() async {
    await Future.delayed(Duration(milliseconds: 1));
    setState(() {
      text = Random().nextInt(9999999).toString();
    });
    v();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Hello",
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
      ),
      body: GestureDetector(
        onTap: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TestPage2()));
        },
        child: Container(
          color: widget.text == "B" ? Colors.red : Colors.yellow,
        ),
      ),
    );
  }
}