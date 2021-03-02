import 'package:firebase_auth/firebase_auth.dart';
import 'package:rhumatologie/models/app_user.dart';

class AuthService {

  final  FirebaseAuth _auth=FirebaseAuth.instance;

  //create user object based on firebase user
  AppUser _userFromFireBaseUSer (User user){
    if(user!=null){
    String ch= user.uid.toString();
    return  AppUser(uid:ch);}
    else return null;
  }

  //auth change user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges()
    //.map((User user) => _userFromFireBaseUSer(user));
    .map(_userFromFireBaseUSer);
  }


  //sign in anonymously ?
  Future  signInAnon() async{
    try {
      UserCredential result= await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFireBaseUSer(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      return _userFromFireBaseUSer(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user=result.user;
      return _userFromFireBaseUSer(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

 //sign out
  Future  signOut() async{
    try {
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

}