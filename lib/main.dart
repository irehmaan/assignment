import 'package:assignment/blocs/auth/auth_bloc.dart';
import 'package:assignment/firebase_options.dart';
import 'package:assignment/repo/auth_repo.dart';
import 'package:assignment/screens/auth_screen.dart';

import 'package:assignment/theme/dark_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(Auth_Repo()),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: darkTheme,
          home: AuthScreen()),
    );
  }
}
