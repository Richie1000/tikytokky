import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tikytokky/constants.dart';

class TextInputField extends StatelessWidget {
  String hintText;
  bool isPassword;
  String labelText;
  final TextEditingController controller;
  final IconData icon;
  TextInputField({Key? key, required this.hintText, required this.isPassword, required this.labelText, required this.controller, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 20
          
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor
          ),
        )
      ),
    );
  }
}