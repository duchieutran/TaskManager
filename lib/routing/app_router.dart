import 'package:flutter/material.dart';
import 'package:taskmanager/views/home/home.dart';
import 'package:taskmanager/views/login_signup/login.dart';
import 'package:taskmanager/views/login_signup/singup.dart';
import 'package:taskmanager/views/splash/splash.dart';
import 'package:taskmanager/views/viewscreen.dart';

class AppRouter {
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => makeRouter(
          nameRouter: settings.name!,
          context: context,
          arguments: settings.arguments),
    );
  }

  static makeRouter(
      {required String nameRouter,
      required BuildContext context,
      Object? arguments}) {
    switch (nameRouter) {
      case splash:
        return const Splash();
      case view:
        return const ViewScreen();
      case home:
        return const Home();
      case login:
        return const Login();
      case singup:
        return const SignUp();
      default:
        throw "$nameRouter is not define";
    }
  }

  static const String splash = '/';
  static const String view = '/view';
  static const String home = '/home';
  static const String singup = '/singup';
  static const String login = '/login';
}
