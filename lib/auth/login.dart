import 'package:Feeleeria/auth/register.dart';
import 'package:Feeleeria/widgets/auth/button.dart';
import 'package:Feeleeria/widgets/auth/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../constant/app_colos.dart';
import '../navigation/navBar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue, // Use the blue color from the theme
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Icon(
                  Iconsax.people, // Add the login icon from iconsax
                  size: 120,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 60, // Increase the size of the login text
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'A place to find your mate on campus!',
                  style: TextStyle(
                    fontSize: 20, // Increase the size of the login text
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  name: "Email",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  name: 'Password',
                  obscure: true,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Login',
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
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Register",
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
      ),
    );
  }
}
