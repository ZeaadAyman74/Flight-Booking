import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flight_booking/src/core/utils/copy_with_wrapper.dart';
import 'package:flight_booking/src/core/utils/enums.dart';
import 'package:flutter/cupertino.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState(bookingState: RequestState.initial));

  //-------------------------------------------------------------------------
  final nameController = TextEditingController();
  final passportNumberController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final specialRequestsController = TextEditingController();

//-------------------------------------------------------------------------

  void changePassportExpireDate(DateTime date) {
    emit(state.copyWith(expireDate: date.copyWithWrapper));
  }

//-------------------------------------------------------------------------

@override
  Future<void> close() {
    nameController.dispose();
    passportNumberController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    specialRequestsController.dispose();
    return super.close();
  }
}
