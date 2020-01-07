import 'package:budget_sidekick/Expenses/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_sidekick/Expenses/AddExpense.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  static const String id = 'menu_screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Menu());
  }
}

class Menu extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinuser;

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinuser = user;
        print(loggedinuser.email);
      }
    } catch (E) {}
  }

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
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Icon(
                          Icons.add,
                          size: 100,
                        ),
                        onPressed: () {
                          //Navigator.pushNamed(context, AddExpense.id);
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Expenses()));
                        },
                      ),
                      Container(
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
