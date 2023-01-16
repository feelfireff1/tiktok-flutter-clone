import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';
import 'package:tiktok_clone_bloc/onboarding/interests_screen.dart';
import 'package:tiktok_clone_bloc/login_form/login_form.dart';
import 'package:tiktok_clone_bloc/widgets/widgets.dart';

class LoginFormPage extends StatelessWidget {
  const LoginFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormCubit(),
      child: LoginFormView(),
    );
  }
}

class LoginFormView extends StatelessWidget {
  const LoginFormView({super.key});

  void _routeToInterest(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const InterestsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginFormCubit, LoginFormState>(
      listenWhen: (_, current) => current.status == LoginFormStatus.success,
      listener: (context, _) => _routeToInterest(context),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Log in'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
            child: Form(
              key: state.formKey,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) =>
                        context.read<LoginFormCubit>().validateEmail(value),
                    onSaved: (newValue) =>
                        context.read<LoginFormCubit>().onSavedEmail(newValue),
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (value) =>
                        context.read<LoginFormCubit>().validatePassword(value),
                    onSaved: (newValue) => context
                        .read<LoginFormCubit>()
                        .onSavedPassword(newValue),
                  ),
                  Gaps.v28,
                  FormButton(
                    text: 'Log in',
                    disabled: false,
                    onPressed: () =>
                        context.read<LoginFormCubit>().onSubmitTap(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
