import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prototype/models/individuals.dart';
import 'package:prototype/models/item.dart';
import 'package:prototype/models/theuser.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  static var shared = DatabaseService();

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('categories');
  final CollectionReference professionsCollection = FirebaseFirestore.instance.collection('professions');
  final CollectionReference citiesCollection = FirebaseFirestore.instance.collection('cities');

  final List<Item> categories = [
    Item(title: "Agriculture",
        items:[
          "Ecologist",
          "Environmental engineer",
          "Farm manager",
          "Fisheries officer",
          "Hydro geologist",
          "Marine scientist"
        ]
    ),
    Item(title: "Finance",
        items:[
          "Financial analyst",
          "Accountant",
          "Financial planner",
          "Financial advisor",
          "Asset manager",
          "Portfolio manager"
        ]
    ),
    Item(title: "Health Science",
        items:[
          "Pharmacologist",
          "Biomedical scientist",
          "Clinical immunolgy scientist",
          "Histology technician",
          "Surgical technician"
        ]
    ),
    Item(title: "Information Technology",
        items: [
          "Computer support specialist",
          "Hardware engineer ",
          "Computer systems analyst",
          "Software developer",
          "Programmer",
          "Web developer ",
          "Network engineer",
          "Software tester",
          "Technical sales",
          "Business analyst",
          "User experience (UX) designer"
        ]
    )
  ];

  final List<String> cities = [
    "Karachi",
    "Lahore",
    "Faisalabad",
    "Rawalpindi",
    "Gujranwala",
    "Peshawar",
    "Multan",
    "Hyderabad",
    "Islamabad",
    "Quetta",
    "Bahawalpur",
    "Sargodha",
    "Sialkot",
    "Sukkur",
    "Larkana",
    "Sheikhupura",
    "Rahim Yar Khan",
    "Jhang",
    "Dera Ghazi Khan",
    "Gujrat",
    "Sahiwal",
    "Mardan",
    "Kasur",
    "Okara",
    "Nawabshah",
    "Chiniot",
    "Kotri",
    "Hafizabad",
    "Sadiqabad",
    "Mirpur Khas",
    "Burewala",
    "Kohat",
    "Khanewal",
    "Turbat",
    "Muzaffargarh",
    "Abbotabad",
    "Mandi Bahauddin",
    "Shikarpur",
    "Jacobabad",
    "Jhelum",
    "Khanpur",
    "Khairpur",
    "Khuzdar",
    "Pakpattan",
    "Hub",
    "Daska",
    "Gojra",
    "Dadu"
  ];

  Future updateUserData(String userName, String email, String address) async {
    return await usersCollection.doc(uid).set({
      'name': userName,
      'email': email,
      'address': address,
    });
  }

  Future editProfile(String name, String number, String address, String description) async{
  return await usersCollection.doc(uid).update({
    'name': name,
    'number': number,
    'address': address,
    'description': description
  } );
  }

  Future updateData(String category, String profession, String city) async {
    return await usersCollection.doc(uid).update({
      'category': category,
      'profession': profession,
      'city': city
    } );
  }


  //users list from snapshot
  List<Individuals> _individualsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Individuals(
          name: doc.data()['name'] ?? '',
          profession: doc.data()['profession'] ?? '',
          address: doc.data()['address'] ?? '',
          city: doc.data()['city']
      );
    }).toList();
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      number: snapshot.data()['number'],
      email: snapshot.data()['email'],
      address: snapshot.data()['address'],
      description: snapshot.data()['description'],
      category: snapshot.data()['category'],
      profession: snapshot.data()['profession'],
      city: snapshot.data()['city']
    );
  }

  //get users stream
  Stream<List<Individuals>> get users {
    final users = usersCollection.snapshots().map((event) => _individualsListFromSnapshot(event));
    return users;
  }
  //get users documents
  Stream<UserData> get userData {
    return usersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
    }
  }
