import 'package:flutter/material.dart';
import 'NavigationService.dart';

class TestPage2 extends StatelessWidget {
  String text = "123";
  int count;

  TestPage2(this.text, this.count);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "我是Flutter页面",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          brightness: Brightness.light,
          leading:Navigator.canPop(context)?null:IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              NavigationService().pop();
            },
          ),
        ),
        body: GestureDetector(
          onTap: () {
            if ((count + 1)%3 == 0){
              NavigationService().openPage(params: {
                "page":text == "B"?"A":"B",
                "count":count + 1,
              });
            }else {
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TestPage2(text == "B"?"A":"B", count + 1)));
            } 
          },
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}