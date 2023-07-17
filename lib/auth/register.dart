import 'package:Feeleeria/auth/login.dart';
import 'package:Feeleeria/navigation/navBar.dart';
import 'package:Feeleeria/widgets/auth/button.dart';
import 'package:Feeleeria/widgets/auth/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  void signup() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

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
                Iconsax.tag_user, // Add the register icon from iconsax
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
                name: "Name",
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                name: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                name: 'Password',
                obscure: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Register',
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
