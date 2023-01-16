import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_form_state.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(LoginFormState(key: GlobalKey<FormState>()));

  Map<String, String> _formData = {};

  String? validateEmail(String? value) {
    if (value != null && value.isEmpty) {
      return "Please write your email";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Please write your password";
    }

    return null;
  }

  void onSavedPassword(String? password) {
    if (password != null) {
      _formData['password'] = password;
    }
  }

  void onSavedEmail(String? email) {
    if (email != null) {
      _formData['email'] = email;
    }
  }

  void onSubmitTap() {
    if (state.formKey.currentState?.validate() == true) {
      state.formKey.currentState?.save();
      emit(state.copyWith(status: LoginFormStatus.success));
    }
  }
}
