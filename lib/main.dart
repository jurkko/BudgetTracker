import 'package:budget_sidekick/Event/AddEvent.dart';
import 'package:budget_sidekick/Expenses/AddExpense.dart';
import 'package:budget_sidekick/Menu/HomePage.dart';
import 'package:budget_sidekick/Menu/MainMenu.dart';
import 'package:budget_sidekick/RegistrationAndLogin/Login.dart';
import 'package:budget_sidekick/RegistrationAndLogin/Registration.dart';
import 'package:budget_sidekick/RegistrationAndLogin/Welcome.dart';

import 'package:flutter/material.dart';

import 'package:budget_sidekick/Views/Wrapper/Welcome/Start.dart';
import 'package:budget_sidekick/Views/Wrapper/Welcome/Login.dart';
import 'package:budget_sidekick/Views/Wrapper/Welcome/Register.dart';

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
        MenuView.id: (context) => MenuView(),
        AddExpense.id: (context) => AddExpense(),
        AddEvent.id: (context) => AddEvent(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}

/*



class BudgetTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartView(),
      initialRoute: 'Start',
      routes: {
        StartView.id: (context) => StartView(),
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
      },
    );
  }
}
*/
