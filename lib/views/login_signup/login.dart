import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:taskmanager/routing/app_router.dart';
import 'package:taskmanager/viewmodels/auth_model.dart';
import 'package:taskmanager/views/login_signup/widgets/sign_animation.dart';
import 'package:taskmanager/views/login_signup/widgets/sign_plugin.dart';
import 'package:taskmanager/views/login_signup/widgets/sign_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final AuthModel authModel = Provider.of<AuthModel>(context);
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
                            "Login",
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
              padding: const EdgeInsets.all(30.0),
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
                                hintText: "Email",
                                controller: authModel.emailController),
                            SignTextfield(
                                hintText: "Password",
                                controller: authModel.passwordController),
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
                          singin(authModel);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
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
                          Navigator.pushNamed(context, AppRouter.singup),
                      title: "Don't have an account? Sign up."),
                  const SizedBox(
                    height: 20,
                  ),
                  SignPlugin(onTap: () {}, title: "Forgot Password ?"),
                ],
              ),
            ),
            // End textfield
          ],
        ),
      ),
    );
  }

  Future<void> singin(AuthModel authModel) async {
    bool success = await authModel.singIn();
    if (success) {
      if (mounted) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: "Login Success");
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
            context: context, type: QuickAlertType.error, title: "Login Fail");
      }
    }
  }
}
