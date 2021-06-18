import 'package:flutter/material.dart';
import 'package:prototype/screens/authenticate/sign_in.dart';
import 'package:prototype/screens/authenticate/register.dart';

class authenticate extends StatefulWidget {
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {

  bool ShowSignIn = true;
  void toggleView() {
    setState(() => ShowSignIn = !ShowSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(ShowSignIn){
      return Signin(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}
