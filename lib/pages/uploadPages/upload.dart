import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';

class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.close_circle, color: Colors.blue),
          onPressed: () {
            // Handle discard action
          },
        ),
        title: Center(
          child: Text(
            "Create",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle publish action
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "Publish",
                style: GoogleFonts.poppins(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/Profile.jpg'),
                ),
                const SizedBox(width: 8.0),
                Text(
                  "What do you want to post?",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Empty space for user input
            Center(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Type your content here",
                ),
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Slider or toggle button for post and story option
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpeedDial(
                        buttonSize: const Size(40, 40),
                        overlayColor: Colors.black,
                        backgroundColor: AppColor.blue,
                        activeChild: const Icon(Icons.close),
                        children: [
                          SpeedDialChild(
                            child: const Icon(Iconsax.activity),
                            onTap: () {},
                          ),
                          SpeedDialChild(
                            child: const Icon(Iconsax.activity),
                            onTap: () {},
                          ),
                          SpeedDialChild(
                            child: const Icon(Iconsax.activity),
                            onTap: () {},
                          ),
                        ],
                        child: const Icon(Iconsax.add)),
                    Text(
                      "Post",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Story",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
