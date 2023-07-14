import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/login.dart';
import '../../constant/app_colos.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                // Navigate to change password page
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
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
