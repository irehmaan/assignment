import 'package:assignment/blocs/auth/auth_bloc.dart';
import 'package:assignment/common/button.dart';
import 'package:assignment/common/input_field.dart';
import 'package:assignment/repo/auth_repo.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthBloc(Auth_Repo()),
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "IDUTE",
                style: TextStyle(fontSize: 27),
              ),
              const SizedBox(
                height: 130,
              ),
              InputTextField(
                  onChanged: (value) {
                    context.read<AuthBloc>().add(EmailChanged(value));
                  },
                  controller: usernameController,
                  hintText: 'E-mail',
                  obscureText: false),
              InputTextField(
                  onChanged: (value) {
                    context.read<AuthBloc>().add(PasswordChanged(value));
                  },
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: false),
              Button(
                  onTap: () {
                    context.read<AuthBloc>().add(FormSubmit());
                  },
                  text: "Sign-in")
            ],
          ),
        ),
      ),
    );
  }
}
