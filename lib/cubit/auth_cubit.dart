import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_sweet_home/services/auth_service.dart';
import 'package:home_sweet_home/services/user_service.dart';

import '../models/user_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signUp(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      String messageToDisplay;
      switch (e.code) {
        case 'email-already-in-use':
          messageToDisplay = 'The email is already in use';
          break;
        case 'invalid-email':
          messageToDisplay = 'The email you entered is invalid';
          break;
        case 'operation-not-allowed':
          messageToDisplay = 'This operation is not allowed';
          break;
        case 'weak-password':
          messageToDisplay = 'The password you entered is too weak';
          break;
        case 'confirm-password':
          messageToDisplay = 'The password you entered is don\'t match';
          break;
        default:
          messageToDisplay = 'Please check your field !';
          break;
      }

      emit(
        AuthFailed(messageToDisplay),
      );
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      String messageToDisplay;
      switch (e.code) {
        case 'invalid-email':
          messageToDisplay = 'The email you entered is invalid';
          break;
        case 'wrong-password':
          messageToDisplay = 'The password you entered is wrong';
          break;
        default:
          messageToDisplay = 'Please check your email and password again !';
          break;
      }

      emit(
        AuthFailed(messageToDisplay),
      );
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
