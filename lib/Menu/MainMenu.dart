import 'package:budget_sidekick/Expenses/Expenses.dart';
import 'package:flutter/cupertino.dart';
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
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Hello *user*'),
                      Text('Your current expenses are:')
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Expenses()));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 160.0,
                                height: 200,
                                decoration: new BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius:
                                        new BorderRadius.circular(20)),
                                child: Center(child: Text("TRASH",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                              ),
                              
                            ],
                            
                          ),
                        ),
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 160.0,
                                height: 200,
                                decoration: new BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius:
                                        new BorderRadius.circular(20)),
                                child: Center(child: Text("CANCER",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 160.0,
                                height: 200,
                                decoration: new BoxDecoration(
                                    color: Colors.purple[400],
                                    borderRadius:
                                        new BorderRadius.circular(20)),
                                child: Center(child: Text("UBI ME",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Your latest expenses:',
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
