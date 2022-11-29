import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:techogram/core/utils.dart';
import 'package:techogram/features/auth/repository/auth_repository.dart';

import '../../../models/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); //represents loading

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false; //after fetching value of user
    user.fold(
        (l) => showSnackBar(context, l.message),
        (UserModel) =>
            _ref.read(userProvider.notifier).update((state) => UserModel));
  }

  void logout() async {
    _authRepository.logOut();
  }
}
