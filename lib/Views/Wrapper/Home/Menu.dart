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
        title: Text('test'),
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), title: Text('Expenses')),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.alarm), title: Text('Events')),
          ]),
      backgroundColor: Colors.white,
    ));
  }
}