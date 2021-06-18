import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/home/edit_profile.dart';
import 'package:prototype/screens/home/organizations.dart';
import 'package:prototype/screens/home/professionals.dart';
import 'package:prototype/screens/home/profile.dart';
import 'package:prototype/screens/home/service_registration.dart';
import 'package:prototype/screens/wrapper.dart';
import 'package:prototype/services/auth.dart';
import 'package:prototype/services/database.dart';
import 'package:provider/provider.dart';
import 'models/theuser.dart';
import 'package:prototype/screens/home/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // DatabaseService.shared.dumpData();
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),
        routes: {
          'profile': (context) => Profile(),
          'professionals': (context) => Professional(),
          'organizations': (context) => Organization(),
          'services': (context) => Services(),
          'editProfile': (context) => EditProfile(),
      }
      ),
    );
  }
}

