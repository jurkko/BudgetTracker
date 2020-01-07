import 'package:budget_sidekick/Expenses/AddExpense.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budget_sidekick/Menu/MainMenu.dart';

class Expenses extends StatefulWidget {
  static const String id = 'expenses';
  @override
  _Expenses createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    getCurrentUser();
    getExpensesStream();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (E) {}
  }

  void getExpensesStream() async {
    await for (var snapshot in _firestore.collection('Expense').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new AddExpense()));
        },
        label: Text('Add new expense'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
