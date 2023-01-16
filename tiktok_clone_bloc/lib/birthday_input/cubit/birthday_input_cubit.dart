import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'birthday_input_state.dart';

class BirthdayInputCubit extends Cubit<BirthdayInputState> {
  BirthdayInputCubit({required TextEditingController birthdayController})
      : super(BirthdayInputState(
          birthdayController: birthdayController,
          initialDate: DateTime.now(),
        )) {
    _birthdayController = birthdayController;
    setDate(state.initialDate);
  }

  late final TextEditingController _birthdayController;
  late DateTime selectedDate;

  @override
  Future<void> close() {
    _birthdayController.dispose();
    return super.close();
  }

  void onNextTap() {
    emit(state.copyWith(destination: BirthdayInputDestination.interest));
  }

  void setDate(DateTime date) {
    selectedDate = date;
    String formatted = DateFormat('d MMMM yyyy').format(date);
    _birthdayController.value = TextEditingValue(text: formatted);
  }
}
