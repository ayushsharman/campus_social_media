import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/auth/button.dart';
import '../widgets/auth/text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Password Reset'),
          content: const Text(
              'Password reset email has been sent. Please check your email.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _resetPassword() async {
    final email = _emailController.text;
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        _showSuccessDialog(context);
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'An error occurred. Please try again later.';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with this email address.';
        }
        _showErrorDialog(context, errorMessage);
      } catch (e) {
        print(e);
      }
    } else {
      _showErrorDialog(context, 'Please enter your email to reset password.');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Enter your email to recieve the mail for resetting password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                name: "Email",
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Reset Password',
                onpressed: _resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
