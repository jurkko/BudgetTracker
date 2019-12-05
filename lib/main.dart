import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Budget Sidekick')),
              leading: Icon(Icons.menu),
              flexibleSpace: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
            ),
            backgroundColor: Colors.blueAccent,
            body: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 50, 20, 30),
                        width: 150,
                        height: 150,
                        child: Icon(
                          Icons.add,
                          size: 100,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 30, 20, 50),
                        width: 150,
                        height: 150,
                        child: Icon(
                          Icons.insert_chart,
                          size: 100,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 50, 20, 30),
                        width: 150,
                        height: 150,
                        child: Icon(
                          Icons.redeem,
                          size: 100,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 30, 20, 50),
                        width: 150,
                        height: 150,
                        child: Icon(
                          Icons.event,
                          size: 100,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
