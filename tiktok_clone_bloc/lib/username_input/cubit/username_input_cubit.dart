import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'username_input_state.dart';

class UsernameInputCubit extends Cubit<UsernameInputState> {
  UsernameInputCubit({required TextEditingController usernameController})
      : _usernameController = usernameController,
        super(UsernameInputState(usernameController: usernameController)) {
    usernameController.addListener(_textEdited);
  }

  final TextEditingController _usernameController;

  String get _username => _usernameController.text;

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
    _usernameController..dispose();
    return super.close();
  }
}
