import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginWithEmailAndPass(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e); // TODO : custom lại throw
    }
    return null;
  }

  Future<User?> signupWithEmailAndPass(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e); // TODO : custom lại throw
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
