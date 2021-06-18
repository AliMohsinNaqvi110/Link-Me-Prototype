import 'package:flutter/material.dart';
import 'package:prototype/models/individuals.dart';
import 'package:prototype/screens/home/service_registration.dart';
import 'package:prototype/services/auth.dart';
import 'package:prototype/services/database.dart';
import 'package:provider/provider.dart';
import 'package:prototype/screens/home/user_card.dart';
import 'package:prototype/screens/home/profile.dart';
import 'package:prototype/screens/home/discover.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


      return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: [
          Discover(),
          ServiceRegistration(),
          Profile(),
        ].elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: ('Register')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: ('Profile')),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
