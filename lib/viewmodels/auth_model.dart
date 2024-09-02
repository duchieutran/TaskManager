import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/services/firebase_authentication.dart';

class AuthModel extends ChangeNotifier {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> singIn() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      await _authentication.loginWithEmailAndPass(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> singUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      User? user = await _authentication.signupWithEmailAndPass(
          email: email, password: password);
      _firestore
          .collection('users')
          .doc(user!.uid)
          .set({'email': email, 'uid': user.uid});
      return true;
    } catch (e) {
      return false;
    }
  }
}
