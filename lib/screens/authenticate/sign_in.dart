import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/services/auth.dart';
import 'package:prototype/shared/constants.dart';
import 'package:prototype/shared/loading.dart';

class Signin extends StatefulWidget {

  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email ='';
  String password ='';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.indigo[900],
              Colors.indigo[600],
              Colors.indigo[300]
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80.0),
            Padding(
             padding: EdgeInsets.only(left: 30.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(
                   'Login',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 40.0,
                     fontWeight : FontWeight.bold
                   ),
                 ),
                 SizedBox(height: 10.0),
                 Text(
                   'welcome back',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                   ),
                 ),
               ],
             ),
            ),
            SizedBox(height: 20),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 50.0,right: 50.0),
                            child: Form(
                              key: _formKey,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 20.0,),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: "Email"),
                                      validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },

                                    ),
                                    SizedBox(height: 20.0,),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: "Password"),
                                      obscureText: true,
                                      validator: (val) => val.length < 6 ? 'Enter a password of at least 6 digits' : null,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                    ),
                                    SizedBox(height: 20.0,),
                                    ButtonTheme(
                                      minWidth: 200,
                                      height: 50,
                                      child: RaisedButton(
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        color: Colors.indigo[600],
                                        onPressed: () async {
                                          if(_formKey.currentState.validate()) {
                                            dynamic result = _auth.signInWithEmailAndPassword(email, password);
                                            setState(() => error = "Enter a valid email or password");
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 50.0),
                                    Text(
                                        'Not a user yet?',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(height: 15.0),
                                    ButtonTheme(
                                      minWidth: 200,
                                      height: 50,
                                      child: RaisedButton(
                                        onPressed: () {
                                          widget.toggleView();
                                        },
                                        color: Colors.indigoAccent,
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      error,
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}