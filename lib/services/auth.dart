import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prototype/models/theuser.dart';
import 'package:prototype/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //register
  Future register(String userName, String email, String password, String address) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //create a new user with the uid
      await DatabaseService(uid:user.uid).updateUserData(userName, email, address); //name, description, contactNum, address, likes //
      return _fromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _fromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async {
    try{
      return _auth.signOut();
    }
    catch(e) {
      print(e.toString());
    }
}


// Login Anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // create user object based on firebase user

  TheUser _fromFirebaseUser(User user)
  {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  //Stream of users

  Stream<TheUser> get user {
    return _auth.authStateChanges()
        .map((User user) => _fromFirebaseUser(user));
  }

}