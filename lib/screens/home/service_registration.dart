import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/models/item.dart';
import 'package:prototype/models/theuser.dart';
import 'package:prototype/services/database.dart';
import 'package:prototype/shared/constants.dart';
import 'package:provider/provider.dart';

class ServiceRegistration extends StatefulWidget {
  @override
  _ServiceRegistrationState createState() => _ServiceRegistrationState();
}

class _ServiceRegistrationState extends State<ServiceRegistration> {

  List<String> professions;

  String selectedCategory = "";
  String selectedProfession = "";
  String selectedCity = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: <Widget>[
                Text("Get Registered Now",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text("To let your clients be able to contact you",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo
                    ),
                  ),
                ),
                SizedBox(height: 200,),
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  child: Container(
                    color: Colors.grey[200],
                    height: 300,
                    width: 400,
                    child: Form(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            DropdownButtonFormField<String>(
                              decoration: textInputDecoration.copyWith(hintText: "Category",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                                //prefixIcon: Icon(Icons.person)
                              ),
                              items: DatabaseService.shared.categories.map((Item item) {
                                return new DropdownMenuItem<String>(
                                  value: item.title,
                                  child: new Text(item.title),
                                );
                              }).toList(),
                              onChanged: (category) {
                                setState(() {
                                  selectedCategory = category;
                                  professions = DatabaseService.shared.categories.where((element) => element.title == category).first.items;
                                });
                              },
                            ),
                            SizedBox(height: 20,),
                            DropdownButtonFormField<String>(
                              decoration: textInputDecoration.copyWith(hintText: "Profession",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                                //prefixIcon: Icon(Icons.person)
                              ),
                              items: professions == null ?  null : professions.map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (profession) {
                                selectedProfession = profession;
                              },
                            ),
                            SizedBox(height: 20,),
                            DropdownButtonFormField<String>(
                              decoration: textInputDecoration.copyWith(hintText: "City",
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
                                selectedCity = city;
                              },
                            ),
                            SizedBox(height: 20,),
                            FlatButton(onPressed: (){
                              DatabaseService(uid: user.uid).updateData(selectedCategory, selectedProfession, selectedCity);
                            }, child: Text("Save", style: TextStyle(color: Colors.white),), color: Colors.indigo,)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
