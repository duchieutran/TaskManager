import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/models/users.dart';
import 'package:taskmanager/services/firebase_authentication.dart';
import 'package:taskmanager/services/firebase_firestore.dart';

class AuthModel extends ChangeNotifier {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final FirebaseStore _firebaseStore = FirebaseStore();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  // signin
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

  // singup
  Future<bool> singUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      User? user = await _authentication.signupWithEmailAndPass(
          email: email, password: password);
      Users collectionUser = Users(
          email: email,
          name: nameController.text,
          username: usernameController.text);
      await _firebaseStore.informationUser(
          collectionUser, user!);
      return true;
    } catch (e) {
      return false;
    }
  }
}
