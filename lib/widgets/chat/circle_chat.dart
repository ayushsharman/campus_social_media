// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularChats extends StatelessWidget {
  String name;
  String image;

  CircularChats({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(height: 10),
        Text(name, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
