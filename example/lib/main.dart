import 'dart:math';

import 'package:flutter/material.dart';
import 'package:twins/twins.dart';
import 'package:yy_flutter_router/yy_flutter_router.dart';
import 'TestPage1.dart';

void main() {
  runApp(
    YyFlutterRouter.singleton.buildApp((Map params){
      return TestPage1(text: params["text"] ?? "");
    })
  );
}

// void main() {
//   runApp(
//     TwinsApp(
//       fragmentBuilder: (uuid, params) {
//         return Fragment(
//           uuid: uuid,
//           builder: (params) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: true,
//               home: TwinsAppHome(
//                 child: params["text"] == "dialog"
//                     ? TestDialog()
//                     : TestPage1(
//                         text: params["text"] ?? "",
//                       ),
//               ),
//             );
//           },
//           params: params,
//         );
//       },
//       deamonBuilder: (uuid, params) {
//         return TestDaemon(uuid: uuid, params: params);
//       },
//     ),
//   );
// }

// class TestPage1 extends StatefulWidget {
//   final String text;

//   TestPage1({this.text});

//   @override
//   _TestPage1State createState() => _TestPage1State();
// }

// class _TestPage1State extends State<TestPage1> {
//   String text = "123";

//   @override
//   void initState() {
//     super.initState();
//     // v();
//   }

//   void v() async {
//     await Future.delayed(Duration(milliseconds: 1));
//     setState(() {
//       text = Random().nextInt(9999999).toString();
//     });
//     v();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Hello",
//           style: TextStyle(color: Colors.black),
//         ),
//         brightness: Brightness.light,
//       ),
//       body: GestureDetector(
//         onTap: () async {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (_) => TestPage2()));
//         },
//         child: Container(
//           color: widget.text == "B" ? Colors.red : Colors.yellow,
//         ),
//       ),
//     );
//   }
// }

// class TestPage2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text(
//             "Page2",
//             style: TextStyle(color: Colors.black),
//           ),
//           iconTheme: IconThemeData(color: Colors.black),
//           brightness: Brightness.light,
//         ),
//         body: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Container(
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }

class TestDaemon extends Daemon {
  TestDaemon({String uuid, Map params}) : super(uuid: uuid, params: params);

  @override
  dispose() {
    print("dispose test daemon");
    return super.dispose();
  }

  @override
  init() {
    print("init test daemon");
    eee();
    return super.init();
  }

  eee() async {
    if (disposed) return;
    await Future.delayed(Duration(milliseconds: 1000));
    print("echo from test daemon " + DateTime.now().toString());
    eee();
  }
}

class TestDialog extends StatefulWidget {
  @override
  _TestDialogState createState() => _TestDialogState();
}

class _TestDialogState extends State<TestDialog> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool canPop = this.count == 0 ? true : false;
        setState(() {
          this.count = 0;
        });
        return canPop;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(128, 0, 0, 0),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  Twins.dismissDialog();
                },
              ),
            ),
            Positioned.fill(
              child: Center(
                child: AlertDialog(
                  title: Text("I'm title"),
                  content: Text("Count = $count"),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          this.count++;
                        });
                      },
                      child: Text("OK"),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Twins.dismissDialog();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
