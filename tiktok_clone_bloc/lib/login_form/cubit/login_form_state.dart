part of 'login_form_cubit.dart';

enum LoginFormStatus { inProgress, success }

class LoginFormState {
  final LoginFormStatus status;
  final GlobalKey<FormState> formKey;

  LoginFormState({
    LoginFormStatus status = LoginFormStatus.inProgress,
    required GlobalKey<FormState> key,
  })  : this.status = status,
        this.formKey = key;

  LoginFormState copyWith(
      {LoginFormStatus? status, GlobalKey<FormState>? key}) {
    return LoginFormState(
      status: status ?? this.status,
      key: key ?? this.formKey,
    );
  }
}
