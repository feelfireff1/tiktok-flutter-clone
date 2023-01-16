import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';
import 'package:tiktok_clone_bloc/email_input/email_input.dart';
import 'package:tiktok_clone_bloc/username_input/username_input.dart';
import 'package:tiktok_clone_bloc/widgets/widgets.dart';

class UsernameInputPage extends StatelessWidget {
  const UsernameInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsernameInputCubit(
        usernameController: TextEditingController(),
      ),
      child: _UsernameInputView(),
    );
  }
}

class _UsernameInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsernameInputCubit, UsernameInputState>(
      listenWhen: (_, current) =>
          current.destination == UsernameInputDestination.email,
      listener: (context, _) => _routeToEmail(context),
      builder: (context, state) {
        return Scaffold(
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
                  'Create username',
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v8,
                const Text(
                  'You can always change later',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v16,
                TextField(
                  controller: state.usernameController,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    hintText: 'Username',
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
                  onPressed: context.read<UsernameInputCubit>().onNextTap,
                  disabled: state.isFormButtonDisabled,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _routeToEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const EmailInputPage(),
    ));
  }
}
