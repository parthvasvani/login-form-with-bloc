import 'package:flutter/material.dart';
import 'package:login_form/pallete.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const GradientButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Pallete.gradient1,
          Pallete.gradient2,
          Pallete.gradient3,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(328, 55),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          )),
    );
  }
}
