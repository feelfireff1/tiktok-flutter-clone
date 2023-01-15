import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/constants.dart';

import 'email_screen.dart';
import 'widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _usernameController,
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
              onPressed: _onNextTap,
              disabled: _username.isEmpty,
            ),
          ],
        ),
      ),
    );
  }

  void _onNextTap() {
    if (_username.isEmpty) return;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const EmailScreen(),
    ));
  }
}
