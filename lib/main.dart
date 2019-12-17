import 'package:budget_sidekick/Expenses/AddExpense.dart';
import 'package:budget_sidekick/Menu/MainMenu.dart';
import 'package:budget_sidekick/RegistrationAndLogin/Login.dart';
import 'package:budget_sidekick/RegistrationAndLogin/Registration.dart';
import 'package:budget_sidekick/RegistrationAndLogin/Welcome.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(BudgetTracker());
}

class BudgetTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
        ),
      ),
      home: WelcomeScreen(),
      initialRoute: 'Welcome',
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Start.id: (context) => Start(),
        AddExpense.id: (context) => AddExpense(),
      },
    );
  }
}
