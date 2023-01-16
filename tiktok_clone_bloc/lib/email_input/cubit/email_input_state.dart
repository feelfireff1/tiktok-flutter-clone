part of 'email_input_cubit.dart';

enum EmailInputDestination { next }

class EmailInputState {
  final TextEditingController emailController;
  final bool isFormButtonDisabled;
  final String? emailErrorText;
  final EmailInputDestination? destination;

  EmailInputState({
    required this.emailController,
    this.isFormButtonDisabled = true,
    this.emailErrorText = null,
    this.destination = null,
  });

  EmailInputState copyWith({
    bool? isFormButtonDisabled,
    String? emailErrorText,
    EmailInputDestination? destination,
  }) {
    return EmailInputState(
      emailController: this.emailController,
      isFormButtonDisabled: isFormButtonDisabled ?? this.isFormButtonDisabled,
      emailErrorText: emailErrorText,
      destination: destination,
    );
  }
}
