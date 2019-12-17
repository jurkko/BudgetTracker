import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_sidekick/Menu/MainMenu.dart';

class AddExpense extends StatefulWidget {
  static const String id = 'add_expense_screen';
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpense> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
