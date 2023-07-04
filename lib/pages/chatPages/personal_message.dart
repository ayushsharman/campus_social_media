import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';

// ignore: must_be_immutable
class PersonalMessage extends StatelessWidget {
  String name;
  String? image;
  PersonalMessage({
    Key? key,
    required this.name,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: const Icon(
              Iconsax.arrow_circle_left5,
              color: AppColor.blue,
              size: 30,
            ),
            onPressed: () {
              // Handle back button press
            },
          ),
        ),
        title: Center(
          child: Text(
            "Messages",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Iconsax.setting5,
                color: AppColor.blue,
                size: 30,
              ),
              onPressed: () {
                // Handle back button press
              },
            ),
          ),
        ],
      ),
    );
  }
}
