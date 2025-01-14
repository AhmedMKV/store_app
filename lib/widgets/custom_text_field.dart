import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  CustomTextFields(
      {this.onChanged,
      super.key,
      this.inputType,
      required this.hint,
      this.obscureText = false});

  bool? obscureText;

  final String hint;
  Function(String)? onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: hint,
      ),
    );
  }
}
