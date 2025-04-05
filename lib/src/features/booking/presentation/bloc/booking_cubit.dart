import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flight_booking/src/core/utils/copy_with_wrapper.dart';
import 'package:flight_booking/src/core/utils/enums.dart';
import 'package:flight_booking/src/features/booking/data/models/passenger_data_model.dart';
import 'package:flutter/cupertino.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState(bookingState: RequestState.initial));

  //-------------------------------------------------------------------------
  final formKey = GlobalKey<FormState>();
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

  Future<void>bookFlight()async{
    emit(state.copyWith(bookingState: RequestState.loading));
    try {
      PassengerDataModel data= PassengerDataModel(
            fullName: nameController.text,
            passportNumber: passportNumberController.text,
            contactEmail: emailController.text,
            contactPhone: phoneNumberController.text,
            specialRequests: specialRequestsController.text,
            passportExpiry: state.passportExpireDate,
          );
      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(bookingState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(bookingState: RequestState.error));
    }
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
