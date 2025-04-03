part of 'booking_cubit.dart';

@immutable
class BookingState extends Equatable {
  final DateTime? passportExpireDate;
  final RequestState? bookingState;

  const BookingState({this.passportExpireDate, this.bookingState});

  BookingState copyWith({
    CopyWithWrapper<DateTime?>? expireDate,
    RequestState? bookingState,
  }) {
    return BookingState(
      bookingState: bookingState ?? this.bookingState,
      passportExpireDate:
          expireDate == null ? passportExpireDate : expireDate.value,
    );
  }

  @override
  List<Object?> get props => [passportExpireDate, bookingState];
}
