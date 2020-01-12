import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:budget_sidekick/Event/Events.dart';
import 'package:budget_sidekick/Expenses/AddExpense.dart';
import 'package:budget_sidekick/Expenses/Expenses.dart';
import 'package:budget_sidekick/Menu/HomePage.dart';
import 'package:flutter/cupertino.dart';
class MenuView extends StatefulWidget {
  static const String id = 'menu_view';
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final  primaryColor =  const Color(0xFFff1212);
 int _selectedPage = 0;
  final _pageOptions = [
    Expenses(),
    HomeScreen(),
    Events(),
  ];

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
        backgroundColor: primaryColor,
        title: Text('Budget Tracker',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      drawer: new Drawer(
        child: ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Current Nickname',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
            accountEmail: new Text('loggedinuser.email',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
                color: Colors.red,
            ),
          ),
          new ListTile(
            title: new Text('Analyitics',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15.0),),
          ),
          new ListTile(
            title: new Text('Coupons',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15.0),),
          )
        ],),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
        primaryColor: primaryColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.black))),
            child: Container(
              decoration: new BoxDecoration(
                border: Border(
                  top: BorderSide(color: primaryColor,width: 2.0)
                )
              ),
              child: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [ 
                BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money), title: Text('Expenses', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.alarm), title: Text('Events',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),),
              ]),
            ),
      ),
      backgroundColor: Colors.white,
    ));
  }

}