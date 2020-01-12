import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_sidekick/Views/Wrapper/Home/Menu.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login_view';
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static final primaryColor =  const Color(0xFFff1212);
  final textData = new ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    textSelectionColor: primaryColor,
    cursorColor: primaryColor,
  );

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFFff1212)),
      ),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Row(  //Application name
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Sign In",style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
                )
              ],
            ),
            new SizedBox( //Space
              height: 30.0,
            ),
            Padding(  //Email input
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
              child: new Theme(
                data: textData,
                  child: new TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                    labelText: 'Email',
                    
                  ),
                  onChanged: (value) {
                  email = value;
                },
                ),
              ),
            ),
            Padding(  //Password input
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 0.0),
              child: new Theme(
                data: textData,
                child: new TextField(
                  obscureText: true,
                 
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                    labelText: 'Password'
                  ),
                  onChanged: (value) {
                  password = value;
                },
                ),
              ),
            ),
            new Row(  //Sign in 
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                  width: 200.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, MenuView.id);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                        child: new Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: primaryColor,
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: new Text("Sign In",style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                  ),
                ),
                )
              ],
            ),

          ],
        ),
      ),
      
    );
  }
}