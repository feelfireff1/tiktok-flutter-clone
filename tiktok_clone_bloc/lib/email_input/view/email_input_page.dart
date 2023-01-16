import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';
import 'package:tiktok_clone_bloc/email_input/email_input.dart';
import 'package:tiktok_clone_bloc/password_input/password_input.dart';

import 'package:tiktok_clone_bloc/widgets/widgets.dart';

class EmailInputPage extends StatelessWidget {
  const EmailInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EmailInputCubit(emailController: TextEditingController()),
      child: _EmailInputView(),
    );
  }
}

class _EmailInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailInputCubit, EmailInputState>(
      listenWhen: (_, current) =>
          current.destination == EmailInputDestination.next,
      listener: (context, _) => _navigateToPassword(context),
      builder: (context, state) {
        return GestureDetector(
          onTap: () => _onScaffoldTap(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Sign up'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v40,
                  const Text(
                    'What is your email?',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v16,
                  TextField(
                    controller: state.emailController,
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete:
                        context.read<EmailInputCubit>().onSubmitTap,
                    autocorrect: false,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: state.emailErrorText,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v28,
                  FormButton(
                    text: 'Next',
                    onPressed: context.read<EmailInputCubit>().onSubmitTap,
                    disabled: state.isFormButtonDisabled,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onScaffoldTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void _navigateToPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordInputPage(),
      ),
    );
  }
}
