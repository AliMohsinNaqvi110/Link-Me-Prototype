import 'package:flutter/material.dart';
import 'package:prototype/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prototype/services/database.dart';
import 'package:provider/provider.dart';
import 'package:prototype/models/theuser.dart';
import 'package:http/http.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String number = '';
  String address = '';
  String description = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',
          style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.indigo[400],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
            child: Column(
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
                SizedBox(height: 30,),
                Container(
                  child: Column(
                      children: <Widget> [
                        Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(hintText: "User Name",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    prefixIcon: Icon(Icons.person)
                                ),
                                onChanged: (val) {
                                setState(() => name = val);
                                    },
                                  )
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    child: TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: "Contact number",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10.0),
                                          prefixIcon: Icon(Icons.phone_android)
                                      ),
                                      onChanged: (val) {
                                        setState(() => number = val);
                                      },
                                    )
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    child: TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: "Address",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10.0),
                                          prefixIcon: Icon(Icons.house_outlined)
                                      ),
                                      onChanged: (val) {
                                        setState(() => address = val);
                                      },
                                    )
                                ),
                                SizedBox(height: 10,),
                                Container(
                                    child: TextFormField(
                                      decoration: textInputDecoration.copyWith(hintText: "Description",
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 10.0),
                                          prefixIcon: Icon(Icons.archive_outlined)
                                      ),
                                      onChanged: (val) {
                                        setState(() => description = val);
                                      },
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        FlatButton(
                          onPressed: () async {
                            await DatabaseService(uid: user.uid).editProfile(name, number, address, description);
                            Navigator.pop(context);
                        },
                          child: Text("Save changes"),
                        ),
                        SizedBox(height: 50,),
                        Center(child: FlatButton.icon(
                          icon: Icon(Icons.arrow_back),
                          label: Text('back to profile'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),)
                      ]
                  ),
                )
              ],
            ),
          )
      );
  }
}
