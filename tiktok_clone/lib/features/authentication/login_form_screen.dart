import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/constants.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Please write your email";
                  }

                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['email'] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(hintText: 'Password'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Please write your password";
                  }

                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData['password'] = newValue;
                  }
                },
              ),
              Gaps.v28,
              FormButton(
                text: 'Log in',
                disabled: false,
                onPressed: _onSubmitTap,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitTap() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const InterestsScreen()),
        (route) => false,
      );
    }
  }
}
