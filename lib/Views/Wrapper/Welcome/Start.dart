import 'package:budget_sidekick/Views/Wrapper/Welcome/Login.dart';
import 'package:budget_sidekick/Views/Wrapper/Welcome/Register.dart';
import 'package:flutter/material.dart';


class StartView extends StatefulWidget {
  static const String id = 'start_view';
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  static final primaryColor =  const Color(0xFFff1212);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(  //Logo of application
              children: <Widget>[
                new Container(
                    height: 150.0,
                    width:150.0,
                    child: Image.asset('images/Red_Pig_Logo.png'),
               )
              ],
            ),
            new Row(  //Application name
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Budget Sidekick",style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
                )
              ],
            ),
            new Row(  //Sign in 
              children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, LoginView.id);
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
            new Row(  //Create account
              children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                        child: new Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                          border: Border.all(color: primaryColor),
                        ),
                        child: new Text("Create Account",style: TextStyle(fontSize: 20.0,color: Colors.black, fontWeight: FontWeight.bold),),
                      ),
                  ),
                ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}