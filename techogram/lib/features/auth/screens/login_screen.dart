import 'package:flutter/material.dart';
import 'package:techogram/core/common/sign_in_button.dart';
import 'package:techogram/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
            // onPressed: () => signInAsGuest(ref, context),
            onPressed: () {},
            child: const Text(
              'Visit Techogram',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      // body: isLoading
      //     ? const Loader()
      //     : Column(
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Your Gram for Tech',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Constants.loginEmotePath,
              height: 400,
            ),
          ),
          const SizedBox(height: 20),
          const SignInButton(),
        ],
      ),
    );
  }
}
