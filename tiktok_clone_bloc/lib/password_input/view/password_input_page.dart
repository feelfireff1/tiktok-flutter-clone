import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_bloc/birthday_input/birthday_input.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';
import 'package:tiktok_clone_bloc/password_input/password_input.dart';

import 'package:tiktok_clone_bloc/widgets/widgets.dart';

class PasswordInputPage extends StatelessWidget {
  const PasswordInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordInputCubit(
        passwordController: TextEditingController(),
      ),
      child: _PasswordInputView(),
    );
  }
}

class _PasswordInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordInputCubit, PasswordInputState>(
      listenWhen: (_, current) =>
          current.destination == PasswordPageDestination.birthday,
      listener: (context, _) => _routeToBirthday(context),
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
                    'Passwordd',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v16,
                  TextField(
                    controller: state.passwordController,
                    obscureText: state.obscureText,
                    onEditingComplete:
                        context.read<PasswordInputCubit>().onSubmitTap,
                    autocorrect: false,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap:
                                context.read<PasswordInputCubit>().onClearTap,
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              color: Colors.grey.shade500,
                              size: Sizes.size20,
                            ),
                          ),
                          Gaps.h16,
                          GestureDetector(
                            onTap: context
                                .read<PasswordInputCubit>()
                                .toggleObscureText,
                            child: FaIcon(
                              state.obscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              color: Colors.grey.shade500,
                              size: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                      hintText: 'Make it strong!',
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
                  Gaps.v10,
                  const Text(
                    'Your password must have:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Gaps.v10,
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: Sizes.size20,
                        color: state.isPasswordValid
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      Gaps.h5,
                      const Text('8 to 20 characters'),
                    ],
                  ),
                  Gaps.v28,
                  FormButton(
                    text: 'Next',
                    onPressed: context.read<PasswordInputCubit>().onSubmitTap,
                    disabled: !state.isPasswordValid,
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

  void _routeToBirthday(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BirthdayInputPage(),
      ),
    );
  }
}
