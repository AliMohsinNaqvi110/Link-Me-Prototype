import 'package:firebase_auth/firebase_auth.dart';

class TheUser
{
final String uid;
TheUser({this.uid});
}

class UserData {

  final String uid;
  final String name;
  final String number;
  final String email;
  final String address;
  final String description;
  final String category;
  final String profession;
  final String city;

  UserData(
      {this.uid, this.name, this.number, this.email, this.address, this.description, this.category, this.profession, this.city}) {}
}
