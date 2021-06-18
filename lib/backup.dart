// import 'package:flutter/material.dart';
// import 'package:prototype/services/auth.dart';
// import 'package:prototype/shared/constants.dart';
//
// class Register extends StatefulWidget {
//
//   final Function toggleView;
//   Register({this.toggleView});
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//
//   //text field state
//   String email = '';
//   String password = '';
//   String error = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: Text('Sign up to Link me'),
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text("Sign in"),
//             onPressed: () {
//               widget.toggleView();
//             },
//           )
//         ],
//       ),
//       body: Container(
//           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//           child: Form(
//             key: _formKey,
//             child: Container(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(height: 20.0,),
//                   TextFormField(
//                     decoration: textInputDecoration.copyWith(hintText: "Email"),
//                     validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
//                     onChanged: (val) {
//                       setState(() => email = val);
//                     },
//
//                   ),
//                   SizedBox(height: 20.0,),
//                   TextFormField(
//                     decoration: textInputDecoration.copyWith(hintText: "Password"),
//                     obscureText: true,
//                     validator: (val) => val.length < 6 ? 'Enter a password of at least 6 digits' : null,
//                     onChanged: (val) {
//                       setState(() => password = val);
//                     },
//                   ),
//                   SizedBox(height: 20.0,),
//                   RaisedButton(
//                     child: Text(
//                       "register",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     color: Colors.indigo[200],
//                     onPressed: () async {
//                       if(_formKey.currentState.validate()) {
//                         dynamic result = _auth.registerWithEmailAndPassword(email, password);
//                         setState(() => error = "Enter a valid email or password");
//                       }
//                     },
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     error,
//                     style: TextStyle(
//                       color: Colors.redAccent,
//                       fontSize: 14.0,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//       ),
//     );
//   }
// }

// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/background.jpg"),
// fit: BoxFit.fitWidth,
// )
// ),

// ListTile(
// tileColor: Colors.blueGrey[100],
// leading: Icon(Icons.contact_phone),
// title: Text("My contact number"),
// ),
// ListTile(
// tileColor: Colors.blueGrey[100],
// leading: Icon(Icons.email_outlined),
// title: Text("Email Address"),
// ),
// ListTile(
// tileColor: Colors.blueGrey[100],
// leading: Icon(Icons.location_city),
// title: Text("Address"),
// ),
// ListTile(
// tileColor: Colors.blueGrey[100],
// leading: Icon(Icons.description),
// title: Text("Description"),
// ),

// ClipRRect(
//   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
//   child: Container(
//     height: MediaQuery.of(context).size.height*0.15,
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [
//           Colors.grey,
//           Colors.blueGrey,
//         ]
//       )
//     ),
//   ),
// ),


// Future getData() async {
// try {
//   Response response = await get(
//       'http://localhost:3000/professionals?city=Bahria Town, Kali Mori&profession=Kachra Bheen na');
//   Map details = jsonDecode(response.body);
//
//   //get values from map
//   String name = details['city'];
//   String profession = details['profession'];
// }
// catch(e) {
//   print(e.toString());
// }
// }

// Column(
// children: <Widget>[
// Center(
// child: Padding(
// padding: EdgeInsets.symmetric(vertical: 30),
// child: CircleAvatar(
// minRadius: 50,
// child: Image(
// image: AssetImage('assets/profile.png'),
// height: 100,
// width: 100,
// ),
// ),
// ),
// ),
// Text("Ali Mohsin Naqvi",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold
// ),),
// SizedBox(height: 10,),
// Text("Software Engineer",
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.bold)
// ),
// SizedBox(height: 30,),
// ClipRRect(
// borderRadius: BorderRadius.circular(30),
// child: Container(
// child: Column(
// children: <Widget> [
// ListTile(
// tileColor: Colors.blueGrey[50],
// leading: Icon(Icons.contact_phone),
// title: Text("My contact number"),
// ),
// ListTile(
// tileColor: Colors.blueGrey[50],
// leading: Icon(Icons.email_outlined),
// title: Text("Email Address"),
// ),
// ListTile(
// tileColor: Colors.blueGrey[50],
// leading: Icon(Icons.location_city),
// title: Text("Address"),
// ),
// ListTile(
// tileColor: Colors.blueGrey[50],
// leading: Icon(Icons.description),
// title: Text("Description"),
// subtitle: Text("An enthusiast for work"),
// ),
// SizedBox(height: 10,),
// Center(child: FlatButton.icon(
// icon: Icon(Icons.edit),
// label: Text('Edit profile'),
// onPressed: () {
// Navigator.pushNamed(context, 'editProfile');
// },
// ),)
// ]
// ),
// ),
// )
// ],
// ),