import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form/bloc/auth_bloc.dart';
import 'package:login_form/pallete.dart';
import 'package:login_form/widgets/gradient_button.dart';
import 'package:login_form/widgets/icon_buttons.dart';
import 'package:login_form/widgets/login_field.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc,AuthState>(
        listener: (BuildContext context, Object? state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          if (state is AuthSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => true,
            );
          }
        },
        builder: (BuildContext context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Pallete.gradient2,
              ),
            );
          }
          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/bg.png"),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [
                          Pallete.gradient1,
                          Pallete.gradient2,
                          Pallete.gradient3,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: const Text(
                      "Sign in..",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  LoginField(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LoginField(
                    controller: passwordController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginRequest(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    }, title: 'SignIn',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          // color: Theme.of(context).colorScheme.tertiary,
                          color: Pallete.gradient1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          //color: Theme.of(context).colorScheme.tertiary,
                          color: Pallete.gradient3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButtons(
                        iconPath: 'assets/images/f_logo.svg',
                        onPressed: () {},
                      ),
                      IconButtons(
                        iconPath: 'assets/images/g_logo.svg',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
