import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prototype/models/individuals.dart';
import 'package:prototype/screens/home/user_card.dart';
import 'package:prototype/services/database.dart';
import 'package:prototype/shared/constants.dart';
import 'package:provider/provider.dart';

import 'UserTile.dart';

class Professional extends StatefulWidget {
  @override
  _ProfessionalState createState() => _ProfessionalState();
}

class _ProfessionalState extends State<Professional> {

  String selectedCity = "Hyderabad";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Professionals"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: textInputDecoration.copyWith(hintText: selectedCity,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
              //prefixIcon: Icon(Icons.person)
            ),
            items: DatabaseService.shared.cities.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (city) {
              setState(() {
                selectedCity = city;
              });
            },
          ),
          Expanded(
              child: StreamBuilder<List<Individuals>>(
                  stream: DatabaseService.shared.users,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Individuals> users = snapshot.data;
                      List<Individuals> filteredUsersBasedOnCity = [];
                      for (Individuals user in users) {
                        if (user.city == selectedCity) {
                          filteredUsersBasedOnCity.add(user);
                        }
                      }
                      return ListView.builder(
                          itemCount: filteredUsersBasedOnCity.length,
                          itemBuilder: (context, index) {
                            return UserTile(user: filteredUsersBasedOnCity[index]);
                          }
                      );
                    }else {
                      return Center(child: Text("No Data"),);
                    }
                  })
          )
        ],
      )
      );
  }
}
//when a user selects this tab, I want to print cards, or List Tiles of the users with their profile picture, name and profession,
// and same for institutes, services.
