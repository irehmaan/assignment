import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Function()? onTap;
  const CustomListTile(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
