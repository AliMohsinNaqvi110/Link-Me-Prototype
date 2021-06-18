// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

EditProfile editProfileFromJson(String str) => EditProfile.fromJson(json.decode(str));

String editProfileToJson(EditProfile data) => json.encode(data.toJson());

class EditProfile {
  EditProfile({
    this.userId,
    this.description,
    this.address,
    this.number,
    this.name,
    this.likes,
  });

  String userId;
  String description;
  String address;
  String number;
  String name;
  int likes;

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
    userId: json["userId"],
    description: json["description"],
    address: json["address"],
    number: json["number"],
    name: json["name"],
    likes: json["likes"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "description": description,
    "address": address,
    "number": number,
    "name": name,
    "likes": likes,
  };
}
