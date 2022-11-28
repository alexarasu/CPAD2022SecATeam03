import 'package:flutter/material.dart';
import 'package:techogram/core/constants/constants.dart';
import 'package:techogram/theme/pallete.dart';

class SignInButton extends StatelessWidget {
  final bool isFromLogin;
  const SignInButton({Key? key, this.isFromLogin = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Padding(
    // padding: const EdgeInsets.all(18.0),
    // child: ElevatedButton.icon(
    return ElevatedButton.icon(
      // onPressed: () => signInWithGoogle(context, ref),
      onPressed: () {},
      icon: Image.asset(
        Constants.googlePath,
        width: 35,
      ),
      label: const Text(
        'Continue with Google',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.greyColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      // ),
    );
  }
}
