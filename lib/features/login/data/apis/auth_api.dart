import 'package:firebase_auth/firebase_auth.dart';

class LoginAPI {
  final FirebaseAuth _auth;

  LoginAPI(this._auth);

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
