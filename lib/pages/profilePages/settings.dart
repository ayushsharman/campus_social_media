import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/forgot_pass.dart';
import '../../auth/landing.dart';
import '../../constant/app_colos.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              onTap: () {
                // Navigate to profile settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: Text(
                'Change Password',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ));
              },
            ),
            const Divider(),
            Text(
              'App Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.blue,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              onTap: () {
                // Navigate to profile settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
