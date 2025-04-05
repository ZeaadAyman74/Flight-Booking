import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get search_flights => 'Search Flights';

  @override
  String get find_flights => 'Find Flights';

  @override
  String get where_would_you_like_to_fly => 'Where would you like to fly?';

  @override
  String get search_for_best_flight_deals => 'Search for the best flight deals';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get select_travel_date => 'Select travel date';

  @override
  String get please_enter_departure_city => 'Please enter departure city';

  @override
  String get please_enter_destination_city => 'Please enter destination city';

  @override
  String get please_select_travel_date => 'Please select the travel date';

  @override
  String get destination_must_be_different => 'Destination must be different';

  @override
  String get flights => 'Flights';

  @override
  String get no_flights_found => 'No Flights Found';

  @override
  String get price => 'Price';

  @override
  String get book_now => 'Book Now';

  @override
  String get arrival => 'Arrival';

  @override
  String get departure => 'Departure';

  @override
  String get total_price => 'Total Price';

  @override
  String get passenger_details => 'Passenger Details';

  @override
  String get full_name => 'Full Name';

  @override
  String get passport_number => 'Passport Number';

  @override
  String get expiry_date => 'Expiry Date';

  @override
  String get seat_preference => 'Seat Preference';

  @override
  String get meal_preference => 'Meal Preference';

  @override
  String get email => 'Email';

  @override
  String get phone_number => 'Phone Number';

  @override
  String get special_requests => 'Special Requests';

  @override
  String get enter_valid_email => 'Please enter a valid email address';

  @override
  String get enter_valid_phone_number => 'Please enter a valid phone number';

  @override
  String get enter_valid_passport_number => 'Please enter a valid passport number';

  @override
  String get optional => '(Optional)';

  @override
  String get select_date => 'Select Date';

  @override
  String get confirm_booking => 'Confirm Booking';

  @override
  String get required_field => 'Required Field';

  @override
  String get ok => 'Ok';

  @override
  String get retry => 'Retry';

  @override
  String get booking_confirmed => 'Booking Confirmed';

  @override
  String get have_save_and_pleasant_journey => 'Have a safe and pleasant journey';

  @override
  String flight(Object flightNumber) {
    return 'Flight $flightNumber';
  }
}
