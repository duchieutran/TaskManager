import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/services/firebase_authentication.dart';

class AuthModel extends ChangeNotifier {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
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

    User? user = await _authentication.loginWithEmailAndPass(
        email: email, password: password);
    return user != null;
  }

  Future<bool> singUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _authentication.signupWithEmailAndPass(
        email: email, password: password);
    return user != null;
  }
}
