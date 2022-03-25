//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/services/users.dart';

abstract class BaseAuth {
  void googleSign();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserServices _userServices = UserServices();

  @override
  void googleSign() async {
    // TODO: implement googleSign
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String ref = "Users";
    try {
      await _firebaseAuth.signInWithCredential(credential).then((user) {
        String id = user.user.uid;
        Map<String,dynamic>value= {
          "name": user.user.displayName,
          "photo": user.user.photoURL,
          "email": user.user.email,
          "userId": id,
        };
        _userServices.createUser(value);
      });
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
