import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prototype/models/theuser.dart';
import 'package:prototype/screens/home/user_card.dart';
import 'package:prototype/services/database.dart';
import 'package:provider/provider.dart';
import 'package:prototype/screens/authenticate/register.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile',
            style: TextStyle(color: Colors.black),),
          elevation: 0.0,
          backgroundColor: Colors.indigo[400],
          centerTitle: true,
        ),
        body: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              UserData userData = snapshot.data;

              return Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: CircleAvatar(
                        minRadius: 50,
                        child: Image(
                          image: AssetImage('assets/profile.png'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  Text(userData.name ?? "",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(height: 10,),
                  Text(userData.profession ?? "",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold)
                  ),
                  SizedBox(height: 30,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      child: Column(
                          children: <Widget>[
                            ListTile(
                              tileColor: Colors.blueGrey[50],
                              leading: Icon(Icons.contact_phone),
                              title: Text(userData.number ?? ""),
                            ),
                            ListTile(
                              tileColor: Colors.blueGrey[50],
                              leading: Icon(Icons.email_outlined),
                              title: Text(userData.email ?? ""),
                            ),
                            ListTile(
                              tileColor: Colors.blueGrey[50],
                              leading: Icon(Icons.location_city),
                              title: Text(userData.address ?? ""),
                            ),
                            ListTile(
                              tileColor: Colors.blueGrey[50],
                              leading: Icon(Icons.description),
                              title: Text(userData.description ?? ""),
                            ),
                            SizedBox(height: 10,),
                            Center(child: FlatButton.icon(
                              icon: Icon(Icons.edit),
                              label: Text('Edit profile'),
                              onPressed: () {
                                Navigator.pushNamed(context, 'editProfile');
                              },
                            ),)
                          ]
                      ),
                    ),
                  )
                ],
              );
            }
            else {
              return Scaffold(
                body: Center(
                  child: Text("Fetching your data.. this might take a while"),
                ),
              );
            }
          }

        ),
    );
  }
}



