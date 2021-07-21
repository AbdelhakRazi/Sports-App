import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSign with ChangeNotifier {
  bool isSignedIn = false;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future signInwithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      isSignedIn = false;
      return null;
    } else {
      isSignedIn = true;
      notifyListeners();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future signInwithFacebook() async {
    final AccessToken facebookUser = await FacebookAuth.instance.login();
    if (facebookUser == null) {
      isSignedIn = false;
      return null;
    } else {
      isSignedIn = true;
      notifyListeners();
      final credential = FacebookAuthProvider.credential(facebookUser.token);
      return await _firebaseAuth.signInWithCredential(credential);
    }
  }

  void logout() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await _firebaseAuth.signOut();
    isSignedIn = false;
    notifyListeners();
  }
}
