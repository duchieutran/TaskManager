import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SignPlugin extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const SignPlugin({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FadeInUp(
        duration: const Duration(milliseconds: 1800),
        child: Text(
          title,
          style: const TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
        ),
      ),
    );
  }
}
