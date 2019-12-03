import 'dart:math';

import 'package:flutter/material.dart';
import 'TestPage2.dart';
import 'NavigationService.dart';

class TestPage1 extends StatefulWidget {
  final String text;
  final int count;

  TestPage1(this.text, this.count);

  @override
  _TestPage1State createState() => _TestPage1State(text, count);
}

class _TestPage1State extends State<TestPage1> {
  String text = "123";
  int count = 0;

  _TestPage1State(this.text, this.count);

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
      appBar: null,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     "Hello",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   brightness: Brightness.light,
      // ),
      body: GestureDetector(
        onTap: () async {
          NavigationService().openPage(params: {
            "page":text == "B"?"A":"B",
            "count":count+1,
          });
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => TestPage2(widget.text == "B"?"A":"B", count ++)));
        },
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: widget.text == "B" ? Colors.red : Colors.yellow,
              ),
              Container(
                child: Text(
                  "Flutter View " + widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}