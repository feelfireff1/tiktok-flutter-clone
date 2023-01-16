import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'username_input_state.dart';

class UsernameInputCubit extends Cubit<UsernameInputState> {
  UsernameInputCubit({required this.usernameController})
      : super(UsernameInputState(usernameController: usernameController)) {
    usernameController.addListener(_textEdited);
  }

  final TextEditingController usernameController;

  String get _username => usernameController.text;

  void _textEdited() {
    emit(state.copyWith(
      isFormButtonDisabled: _username.isEmpty,
      destination: null,
    ));
  }

  void onNextTap() {
    if (_username.isEmpty) return;

    emit(state.copyWith(destination: UsernameInputDestination.email));
  }

  @override
  Future<void> close() {
    usernameController..dispose();
    return super.close();
  }
}
