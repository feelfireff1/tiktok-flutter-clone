import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'email_input_state.dart';

class EmailInputCubit extends Cubit<EmailInputState> {
  EmailInputCubit({required TextEditingController emailController})
      : _emailController = emailController,
        super(EmailInputState(
          emailController: emailController,
        )) {
    emailController.addListener(_emailChanged);
  }

  @override
  Future<void> close() {
    _emailController.dispose();
    return super.close();
  }

  final TextEditingController _emailController;

  String get _email => _emailController.text;

  void onSubmitTap() {
    if (state.isFormButtonDisabled) return;

    emit(EmailInputState(
      destination: EmailInputDestination.next,
      emailController: _emailController,
    ));
  }

  void _emailChanged() {
    emit(state.copyWith(
      emailErrorText: _emailErrorText(),
      isFormButtonDisabled: _email.isEmpty || _emailErrorText() != null,
    ));
  }

  String? _emailErrorText() {
    if (_email.isEmpty) return null;

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }

    return null;
  }
}
