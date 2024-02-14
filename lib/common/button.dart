import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const Button({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
