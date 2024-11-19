import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form/bloc/auth_bloc.dart';
import 'package:login_form/login_screen.dart';
import 'package:login_form/pallete.dart';
import 'package:login_form/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("data"),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (BuildContext context, Object? state) {
            if (state is AuthInitial) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            }
          },
          builder: (BuildContext context, state) {
            if (state is AuthLoading) {
              return  const Center(child: CircularProgressIndicator(color: Pallete.gradient2,));
            }
            if (state is AuthSuccess) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.uid,style: TextStyle(fontSize: 20),),
                    GradientButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                      title: 'SignOut',
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Not Authentication"));
            }
          },
        ));
  }
}
