import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'password_input_state.dart';

class PasswordInputCubit extends Cubit<PasswordInputState> {
  PasswordInputCubit({
    required TextEditingController passwordController,
  }) : super(PasswordInputState(passwordController: passwordController)) {
    this._passwordController = passwordController;
    passwordController.addListener(_onPasswordChange);
  }

  late final TextEditingController _passwordController;

  String get _password => _passwordController.text;
  bool get _isPasswordValid => _password.isNotEmpty && _password.length >= 8;

  @override
  Future<void> close() {
    _passwordController.dispose();
    return super.close();
  }

  void _onPasswordChange() {
    emit(state.copyWith(isPasswordValid: _isPasswordValid));
  }

  void onClearTap() {
    _passwordController.clear();
  }

  void toggleObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void onSubmitTap() {
    if (!_isPasswordValid) return;

    emit(state.copyWith(destination: PasswordPageDestination.birthday));
  }
}
