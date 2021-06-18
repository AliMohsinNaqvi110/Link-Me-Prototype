import 'package:flutter/material.dart';
import 'package:prototype/services/auth.dart';
import 'package:prototype/shared/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String userName = '';
  String email = '';
  String password = '';
  String address = '';
  String number = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.indigo[800],
                        Colors.indigo[600],
                        Colors.indigo[400],
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget> [
                        SizedBox(height: 70,),
                        Text("Link Me",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.grey[200],
                      ),),
                        SizedBox(height: 10,),
                        Text("The community of professionals",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[200],
                          ),),
                    ]
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(500)),
                              color: Colors.white,
                            ),
                            child: Container(
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(hintText: "User Name",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 10.0),
                                    prefixIcon: Icon(Icons.person)
                                ),
                                onChanged: (val) {
                                  setState(() => userName = val);
                                },

                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            child: TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: "Email",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10.0),
                                  prefixIcon: Icon(Icons.email)),
                              validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: textInputDecoration.copyWith(hintText: "Password",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (val) => val.length < 6 ? 'Enter a password of at least 6 digits' : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: "Address",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10.0),
                                prefixIcon: Icon(Icons.add_location)),
                              onChanged: (val) {
                                setState(() => address = val);
                              },
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          RaisedButton(
                            child: Text(
                              "register",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.indigoAccent,
                            onPressed: () async {
                            if(_formKey.currentState.validate()) {
                              dynamic result = _auth.register(userName, email, password, address);
                              setState(() => error = "Enter a valid email or password");
                            }
                            },
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          FlatButton.icon(
                            icon: Icon(Icons.chevron_left_rounded),
                            label: Text("Return to Sign in",
                            style: TextStyle(
                              color: Colors.white
                            ),),
                              onPressed: () {
                                widget.toggleView();
                              },
                              color: Colors.indigoAccent,
                           )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
