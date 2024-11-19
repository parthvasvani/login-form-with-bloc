import 'package:flutter/material.dart';
import 'package:login_form/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const LoginField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(17),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary, width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Pallete.gradient2.withOpacity(0.7), width: 1.5),
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
