import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budget_sidekick/Menu/MainMenu.dart';

class AddEvent extends StatefulWidget {
  static const String id = 'add_event_screen';

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEvent> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;

  String eventName;
  int target;
  int current;
  String dateTime; // TODO Date

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (E) {}
  }
  errorAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid inputs'),
          content: const Text('Target cannot be lower than current saved value.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pop(context);
        },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {

        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("You forgot to enter a field"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                eventName = value;
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField( // TODO Datepicker
              controller: TextEditingController()..text = 'Date',
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                dateTime = value;
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: TextEditingController()..text = 'Target',
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                target = int.parse(value);
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: TextEditingController()..text = 'Current',
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                current = int.parse(value);
              },
            ),
            FlatButton(
                onPressed: () {
                  if(target==null || eventName==null || current==null || dateTime==null){
                    showAlertDialog(context);
                  } else if(current>target) {
                    // TODO some other alert
                    errorAlert(context);
                  } else {
                    _firestore.collection('Event').add({
                      'Current': current,
                      'Duedate': dateTime,
                      'Target': target,
                      'Name': eventName,
                      'uid': loggedInUser.uid,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Add event'))
          ],
        ),
      ),
    );
  }
}
