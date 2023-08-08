import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repo.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _repository;

  @override
  FutureOr<UserProfileModel> build() {
    _repository = ref.read(userRepo);
    return UserProfileModel.empty();
  }

  Future<void> createAccount(
    UserCredential credential,
    String email,
    String username,
    String birth,
  ) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      bio: "undefined",
      link: "undefined",
      email: credential.user!.email ?? email,
      uid: credential.user!.uid,
      name: credential.user!.displayName ?? username,
      birth: credential.user!.displayName ?? birth,
    );
    await _repository.createProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final UserProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
