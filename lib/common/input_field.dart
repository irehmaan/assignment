import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;

  const InputTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText),
          SizedBox(
            height: size.height / 16,
            width: size.width,
            child: TextField(
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white),
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade50),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade50),
                      borderRadius: BorderRadius.circular(5)),
                  fillColor: Colors.grey.shade900,
                  filled: true,
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
