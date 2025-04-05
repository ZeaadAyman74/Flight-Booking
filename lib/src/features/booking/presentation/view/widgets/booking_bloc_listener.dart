import 'package:flight_booking/src/core/extensions/context_extensions.dart';
import 'package:flight_booking/src/core/utils/enums.dart';
import 'package:flight_booking/src/core/widgets/dialog_progress_indicator.dart';
import 'package:flight_booking/src/features/booking/presentation/bloc/booking_cubit.dart';
import 'package:flight_booking/src/features/booking/presentation/view/widgets/booking_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBlocListener extends StatelessWidget {
  const BookingBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listenWhen: (previous, current) =>
          current.bookingState != previous.bookingState,
      listener: (context, state) {
        if (state.bookingState == RequestState.loading) {
          showDialog(
            context: context,
            builder: (context) => DialogIndicator(),
          );
        } else if (state.bookingState == RequestState.error) {
          context.pop();
          context.showMessageDialog(message: state.message!);
        } else if (state.bookingState == RequestState.success) {
          context.pop();
          context.pop();
          showDialog(
            context: context,
            builder: (context) => BookingSuccessDialog(),
          );
        }
      },
      child: child,
    );
  }
}
