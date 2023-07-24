// ignore_for_file: use_build_context_synchronously

import 'package:Feeleeria/auth/login.dart';
import 'package:Feeleeria/widgets/auth/button.dart';
import 'package:Feeleeria/widgets/auth/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constant/app_colos.dart';
import '../navigation/navBar.dart';
import '../services/firebase_errors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  void showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      showErrorSnackBar(context, "Passwords do not match. Please try again.");
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Save user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({
        'name': _nameController.text,
        'email': _emailController.text,
        // Add other user data fields as needed
      });

      Navigator.pop(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseErrors.getErrorMessage(e.code);
      showErrorSnackBar(context, errorMessage);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.blue,
      body: SingleChildScrollView(
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
                'Welcome to Feeleeria',
                style: GoogleFonts.poppins(
                  fontSize: 30, // Increase the size of the register text
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
              const SizedBox(height: 10),
              CustomTextField(
                name: 'Confirm Password',
                obscure: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Register',
                onpressed: signUp,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
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
