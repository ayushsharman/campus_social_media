import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 80.0,
                color: Color(0xFF3E8DE3),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Login',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E8DE3),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // Perform login logic here
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFF5C00),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Navigate to the signup page
                },
                child: Text(
                  'Create an account',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF3E8DE3),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Perform login with Google logic here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google_logo.png', // Add the path to your Google logo image
                      height: 20.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Login with Google',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF3E8DE3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
