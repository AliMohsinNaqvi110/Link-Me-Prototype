import 'package:flutter/material.dart';
import 'package:prototype/models/individuals.dart';
import 'package:prototype/models/theuser.dart';
import 'package:prototype/screens/home/home.dart';
import 'package:prototype/services/database.dart';
import 'package:prototype/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:prototype/screens/home/UserTile.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Individuals>>(stream: DatabaseService.shared.users, builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Individuals> users = snapshot.data;
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserTile(user: users[index]);
              }
          );
        }else {
          return Center(child: Text("No Data"),);
        }
      }),
    );
  }
}

