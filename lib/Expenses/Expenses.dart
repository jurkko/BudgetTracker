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
    //getExpensesStream();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        getExpensesStream(loggedInUser);
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('Expense').snapshots(),
                builder: (context, snapshot) {
                  final expenses = snapshot.data.documents;
                  List<Text> expensesWidgets = [];
                  for (var expense in expenses) {
                    final expenseText = expense.data['Value'];
                    final expenseCategory = expense.data['Category'];

                    final expenseWidget = Text(
                      ' and ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                    expensesWidgets.add(expenseWidget);
                  }
                  return Expanded(
                    child: ListView(
                      children: expensesWidgets,
                    ),
                  );
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
  @override
  Widget build(BuildContext context) {
    Text(
      ' and ',
      style: TextStyle(
        fontSize: 20,
      ),
    );
    return Container();
  }
}
