import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';
import 'package:tiktok_clone_bloc/login/login.dart';
import 'package:tiktok_clone_bloc/signup/cubit/signup_cubit.dart';
import 'package:tiktok_clone_bloc/username_input/username_input.dart';
import 'package:tiktok_clone_bloc/widgets/widgets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(children: [
            Gaps.v80,
            const Text(
              'Sign up for TikTok',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            const Text(
              'Create a profile, follow other accounts, make your own videos, and more.',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v40,
            AuthButton(
              onTap: () => _onEmailTap(context),
              icon: const FaIcon(FontAwesomeIcons.user),
              text: 'Use email & password',
            ),
            Gaps.v16,
            AuthButton(
              onTap: () => _onContinueWithAppleTap(context),
              icon: const FaIcon(FontAwesomeIcons.apple),
              text: 'Continue with Apple',
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const LoginPage(),
    ));
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const UsernameInputPage(),
    ));
  }

  void _onContinueWithAppleTap(BuildContext context) {
    print('continue with apple');
  }
}
