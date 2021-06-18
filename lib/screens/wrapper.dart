import 'package:flutter/material.dart';
import 'package:prototype/models/theuser.dart';
import 'package:prototype/screens/authenticate/authenticate.dart';
import 'package:prototype/screens/authenticate/sign_in.dart';
import 'package:prototype/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<TheUser>(context);


    //return either home or authenticate
    if(user == null) {
      return authenticate();
    }
      else {
      return Home();
    }
  }
}
