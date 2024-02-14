import 'package:assignment/blocs/auth/auth_bloc.dart';
import 'package:assignment/common/drawer.dart';
import 'package:assignment/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBloc(Auth_Repo());
    User? currentUser = authBloc.currentUser;
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Text('Welcome,!  '),
            Center(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Column(
                          children: [
                            Text(
                              "Users",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("108", style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Avg usage time",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "108",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Montly Active Users",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Daily Active Users",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
