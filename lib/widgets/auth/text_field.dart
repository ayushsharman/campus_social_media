// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String name;
  bool? obscure;
  CustomTextField({
    Key? key,
    required this.name,
    this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: name,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
