part of 'birthday_input_cubit.dart';

enum BirthdayInputDestination { interest }

class BirthdayInputState {
  final DateTime initialDate;
  final TextEditingController birthdayController;
  final BirthdayInputDestination? destination;

  BirthdayInputState({
    required this.birthdayController,
    required this.initialDate,
    BirthdayInputDestination? this.destination = null,
  });

  BirthdayInputState copyWith({
    BirthdayInputDestination? destination,
  }) {
    return BirthdayInputState(
      birthdayController: this.birthdayController,
      initialDate: this.initialDate,
      destination: destination,
    );
  }
}
