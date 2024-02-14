import 'package:assignment/blocs/auth/auth_bloc.dart';
import 'package:assignment/common/list_tile.dart';
import 'package:assignment/screens/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            "IDUTE",
            style: TextStyle(fontSize: 40),
          )),
          const SizedBox(
            height: 20,
          ),
          CustomListTile(
            icon: Icons.home_filled,
            title: "Home",
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.people_alt,
            title: "Users",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => UserDashBoard()));
            },
          ),
          const CustomListTile(icon: Icons.lightbulb, title: "MVI"),
          const CustomListTile(
              icon: Icons.rocket_launch, title: "Join Startup"),
          const CustomListTile(icon: Icons.info, title: "Reports"),
          const CustomListTile(icon: Icons.help, title: "Help"),
          const CustomListTile(
              icon: Icons.feedback_sharp, title: "App Suggestions"),
          SizedBox(
            height: size.height / 3.6,
          ),
          CustomListTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              context.read<AuthBloc>().add(LogOut());
            },
          )
        ],
      ),
    );
  }
}
