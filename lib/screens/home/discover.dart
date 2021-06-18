import 'package:flutter/material.dart';
import 'package:prototype/services/auth.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

final AuthService _auth = AuthService();

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.indigo[500],
        elevation: 10.0,
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("logout"),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: FittedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'professionals');
                    },
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(26.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "View all the individual professionals in your city",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ) ,),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                    image: AssetImage("assets/individuals.jpg",)
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: FittedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'organizations');
                    },
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(26.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "View all the organizations/institutions",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ) ,),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                    image: AssetImage("assets/organization.png",)
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: FittedBox(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'services');
                    },
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(26.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "View all personal services like shops",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ) ,),
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            child: ClipRRect(
                                borderRadius: new BorderRadius.circular(24.0),
                                child: Image(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                    image: AssetImage("assets/Store.png",)
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
