import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone_bloc/birthday_input/birthday_input.dart';
import 'package:tiktok_clone_bloc/constants/constants.dart';
import 'package:tiktok_clone_bloc/onboarding/interests_screen.dart';
import 'package:tiktok_clone_bloc/widgets/widgets.dart';

class BirthdayInputPage extends StatelessWidget {
  const BirthdayInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BirthdayInputCubit(birthdayController: TextEditingController()),
      child: _BirthdayInputView(),
    );
  }
}

class _BirthdayInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BirthdayInputCubit, BirthdayInputState>(
      listenWhen: (_, current) =>
          current.destination == BirthdayInputDestination.interest,
      listener: (context, _) => _routeToInterest(context),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sign up'),
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 300,
              child: CupertinoDatePicker(
                maximumDate: state.initialDate,
                initialDateTime: state.initialDate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: context.read<BirthdayInputCubit>().setDate,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  'When\'s your birthday?',
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v8,
                const Text(
                  'Your birthday won\'t be shown publicly.',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v16,
                TextField(
                  enabled: false,
                  controller: state.birthdayController,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
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
                  onPressed: context.read<BirthdayInputCubit>().onNextTap,
                  disabled: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _routeToInterest(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const InterestsScreen(),
    ));
  }

  // void _setTextFieldDate(DateTime date) {
  //   final textDate = date.toString().split(' ').first;
  //   _birthdayController.value = TextEditingValue(text: textDate);
  // }
}
