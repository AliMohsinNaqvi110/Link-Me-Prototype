import 'package:flutter/material.dart';
import 'package:prototype/models/individuals.dart';

class UserTile extends StatelessWidget {

  final Individuals user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/default-avatar-profile-flat-icon-vector-contact-symbol-illustration-184752213.jpg"),
          ),
          title: Text(user.name ?? ""),
          subtitle: Text(user.profession ?? ""),
        ),
      ),
    );
  }
}
