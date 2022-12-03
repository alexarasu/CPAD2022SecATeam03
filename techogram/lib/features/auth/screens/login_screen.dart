import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techogram/core/common/loader.dart';
import 'package:techogram/core/common/sign_in_button.dart';
import 'package:techogram/core/constants/constants.dart';
import 'package:techogram/features/auth/controlller/auth_controller.dart';
import 'package:techogram/responsive/responsive.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signInAsGuest(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInAsGuest(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
      ),
      body: isLoading
          ? const Loader()
          : Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Constants.loginEmotePath,
                    height: 400,
                  ),
                ),
                const SizedBox(height: 20),
                const Responsive(child: SignInButton()),
              ],
            ),
    );
  }
}
