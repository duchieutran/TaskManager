import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:taskmanager/routing/app_router.dart';
import 'package:taskmanager/viewmodels/auth_model.dart';
import 'package:taskmanager/views/login_signup/widgets/sign_animation.dart';
import 'package:taskmanager/views/login_signup/widgets/sign_plugin.dart';
import 'package:taskmanager/views/login_signup/widgets/sign_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final AuthModel authentication = AuthModel();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.47.sh,
              width: 1.0.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  SignAnimation(
                      left: 0.4.sw,
                      width: 80,
                      height: 200,
                      image: 'assets/images/light_1.png'),
                  SignAnimation(
                      left: 0.7.sw,
                      seconds: 2,
                      width: 80,
                      height: 150,
                      image: 'assets/images/light_2.png'),
                  SignAnimation(
                      left: 0.1.sw,
                      seconds: 2,
                      width: 80,
                      height: 150,
                      image: 'assets/images/clock.png'),
                  Positioned(
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        margin: EdgeInsets.only(top: 0.15.sh),
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // TextField
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1800),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(143, 148, 251, 1)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            SignTextfield(
                                hintText: "Username",
                                controller: authentication.usernameController),
                            SignTextfield(
                                hintText: "Email",
                                controller: authentication.emailController),
                            SignTextfield(
                                hintText: "Password",
                                controller: authentication.passwordController),
                            SignTextfield(
                                hintText: "Name",
                                controller: authentication.nameController),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1900),
                      child: GestureDetector(
                        onTap: () {
                          singup(authentication);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  SignPlugin(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRouter.login),
                      title: "Already have an account? Log in now."),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // End textfield
          ],
        ),
      ),
    );
  }

  Future<void> singup(AuthModel authModel) async {
    bool success = await authModel.singUp();
    if (success) {
      if (mounted) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: "Register Success");
        await Future.delayed(
          const Duration(seconds: 5),
          () {
            if (mounted) {
              Navigator.pushReplacementNamed(context, AppRouter.view);
            }
          },
        );
      }
    } else {
      if (mounted) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: "Register Fail");
      }
    }
  }
}
