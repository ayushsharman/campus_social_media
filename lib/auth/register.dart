import 'package:Feeleeria/auth/login.dart';
import 'package:Feeleeria/navigation/navBar.dart';
import 'package:Feeleeria/widgets/auth/button.dart';
import 'package:Feeleeria/widgets/auth/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../constant/app_colos.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue, // Use the blue color from the theme
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Icon(
                Iconsax.user, // Add the register icon from iconsax
                size: 120,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                'Register',
                style: GoogleFonts.poppins(
                  fontSize: 60, // Increase the size of the register text
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Create your account to get started!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                name: "Name", // Replace with appropriate field name
              ),
              const SizedBox(height: 10),
              CustomTextField(
                name: 'Email', // Replace with appropriate field name
              ),
              const SizedBox(height: 10),
              CustomTextField(
                name: 'Password', // Replace with appropriate field name
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Register', // Replace with appropriate button text
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNav(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
