part of 'booking_cubit.dart';

@immutable
class BookingState extends Equatable {
  final DateTime? passportExpireDate;
  final RequestState? bookingState;
  final String? message;

  const BookingState({this.passportExpireDate, this.bookingState,this.message=''});

  BookingState copyWith({
    CopyWithWrapper<DateTime?>? expireDate,
    RequestState? bookingState,
    String? message
  }) {
    return BookingState(
      bookingState: bookingState ?? this.bookingState,
      passportExpireDate:
          expireDate == null ? passportExpireDate : expireDate.value,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [passportExpireDate, bookingState,message];
}
