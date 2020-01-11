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

  static String id; //<-- šrotAlert: Ne gre najde mi v streamu loggedInUser.uid

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        getExpensesStream(loggedInUser);
        id = user.uid;
        print(user.uid);
      }
    } catch (E) {}
  }

  void getExpensesStream(FirebaseUser loggedInUser) async {
    await for (var snapshot in _firestore
        .collection('Expense')
        .where('user', isEqualTo: loggedInUser.uid)
        .snapshots()) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
                stream: _firestore
                    .collection('Expense')
                    .where('Sender', isEqualTo: '1234@gmail.com')
                    .snapshots(),
                builder: (context, snapshot) {
                  List<ExpenseContainer> expenseWidgets = [];
                  if (snapshot.hasData) {
                    final expenses = snapshot.data.documents;
                    for (var expense in expenses) {
                      final expenseText = expense.data['Value'];

                      final expenseWidget = ExpenseContainer(
                        value: expenseText,
                      );
                      expenseWidgets.add(expenseWidget);
                    }
                    return Expanded(
                      child: ListView(
                        children: expenseWidgets,
                      ),
                    );
                  }
                })
          ],
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

class ExpenseContainer extends StatelessWidget {
  ExpenseContainer({this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 5,
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '$value and ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
