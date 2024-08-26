import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignAnimation extends StatelessWidget {
  final double left, width, height;
  final int seconds;
  final String image;
  const SignAnimation(
      {super.key,
      required this.left,
      required this.width,
      required this.height,
      this.seconds = 1,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        width: width,
        height: height,
        child: FadeInUp(
          duration: Duration(seconds: seconds),
          child: Container(
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
        ));
  }
}
