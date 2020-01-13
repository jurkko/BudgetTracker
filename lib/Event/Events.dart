import 'package:budget_sidekick/Event/AddEvent.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:budget_sidekick/Menu/MainMenu.dart';

class Events extends StatefulWidget {
  static const String id = 'events';
  @override
  _Events createState() => _Events();
}

class _Events extends State<Events> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    getCurrentUser();
    getEventsStream();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (E) {}
  }

  void getEventsStream() async {
    await for (var snapshot in _firestore
        .collection('Event')
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
                stream: _firestore.collection('Event').snapshots(),
                builder: (context, snapshot) {
                  final events = snapshot.data.documents;
                  List<Text> eventsWidgets = [];
                  for (var e in events) {
                    final eventsName = e.data['Name'];
                    final eventsTarget = e.data['Target'];
                    final eventsCurrent = e.data['Current'];

                    final expenseWidget = Text(
                      '$eventsName , $eventsCurrent / $eventsTarget' ,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                    eventsWidgets.add(expenseWidget);
                  }
                  return Expanded(
                    child: ListView(
                      children: eventsWidgets,
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new AddEvent()));
        },
        label: Text('Add new event'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
