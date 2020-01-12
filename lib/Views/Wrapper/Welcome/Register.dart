import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budget_sidekick/Views/Wrapper/Home/Menu.dart';

class RegisterView extends StatefulWidget {
  static const String id = 'register_view';
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
   final _auth = FirebaseAuth.instance;
  String email;
  String password;

  static final primaryColor =  const Color(0xFFff1212);
  final textData = new ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    textSelectionColor: primaryColor,
    cursorColor: primaryColor,
  );
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
                  child: new Text("Create Account",style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
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
                    labelText: 'Email'
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
            new Row(  //Create account
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
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
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
                          color: Colors.white,
                          border: Border.all(color: primaryColor),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: new Text("Register",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),),
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