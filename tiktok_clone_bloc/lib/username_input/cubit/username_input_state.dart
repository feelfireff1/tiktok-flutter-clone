part of 'username_input_cubit.dart';

enum UsernameInputDestination { email }

class UsernameInputState {
  final TextEditingController usernameController;
  final bool isFormButtonDisabled;
  final UsernameInputDestination? destination;

  UsernameInputState({
    required this.usernameController,
    this.isFormButtonDisabled = true,
    this.destination = null,
  });

  UsernameInputState copyWith({
    bool? isFormButtonDisabled,
    UsernameInputDestination? destination,
  }) {
    return UsernameInputState(
      usernameController: this.usernameController,
      isFormButtonDisabled: isFormButtonDisabled ?? this.isFormButtonDisabled,
      destination: destination,
    );
  }
}
