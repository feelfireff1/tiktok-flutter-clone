part of 'password_input_cubit.dart';

enum PasswordPageDestination { birthday }

class PasswordInputState {
  final bool isPasswordValid;
  final TextEditingController passwordController;
  final bool obscureText;
  final PasswordPageDestination? destination;

  PasswordInputState({
    required this.passwordController,
    this.isPasswordValid = false,
    this.obscureText = true,
    this.destination = null,
  });

  PasswordInputState copyWith({
    bool? isPasswordValid,
    bool? obscureText,
    PasswordPageDestination? destination,
  }) {
    return PasswordInputState(
      passwordController: this.passwordController,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      obscureText: obscureText ?? this.obscureText,
      destination: destination,
    );
  }
}
