import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @search_flights.
  ///
  /// In en, this message translates to:
  /// **'Search Flights'**
  String get search_flights;

  /// No description provided for @find_flights.
  ///
  /// In en, this message translates to:
  /// **'Find Flights'**
  String get find_flights;

  /// No description provided for @where_would_you_like_to_fly.
  ///
  /// In en, this message translates to:
  /// **'Where would you like to fly?'**
  String get where_would_you_like_to_fly;

  /// No description provided for @search_for_best_flight_deals.
  ///
  /// In en, this message translates to:
  /// **'Search for the best flight deals'**
  String get search_for_best_flight_deals;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @select_travel_date.
  ///
  /// In en, this message translates to:
  /// **'Select travel date'**
  String get select_travel_date;

  /// No description provided for @please_enter_departure_city.
  ///
  /// In en, this message translates to:
  /// **'Please enter departure city'**
  String get please_enter_departure_city;

  /// No description provided for @please_enter_destination_city.
  ///
  /// In en, this message translates to:
  /// **'Please enter destination city'**
  String get please_enter_destination_city;

  /// No description provided for @please_select_travel_date.
  ///
  /// In en, this message translates to:
  /// **'Please select the travel date'**
  String get please_select_travel_date;

  /// No description provided for @destination_must_be_different.
  ///
  /// In en, this message translates to:
  /// **'Destination must be different'**
  String get destination_must_be_different;

  /// No description provided for @flights.
  ///
  /// In en, this message translates to:
  /// **'Flights'**
  String get flights;

  /// No description provided for @no_flights_found.
  ///
  /// In en, this message translates to:
  /// **'No Flights Found'**
  String get no_flights_found;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @book_now.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get book_now;

  /// No description provided for @arrival.
  ///
  /// In en, this message translates to:
  /// **'Arrival'**
  String get arrival;

  /// No description provided for @departure.
  ///
  /// In en, this message translates to:
  /// **'Departure'**
  String get departure;

  /// No description provided for @total_price.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get total_price;

  /// No description provided for @passenger_details.
  ///
  /// In en, this message translates to:
  /// **'Passenger Details'**
  String get passenger_details;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @passport_number.
  ///
  /// In en, this message translates to:
  /// **'Passport Number'**
  String get passport_number;

  /// No description provided for @expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiry_date;

  /// No description provided for @seat_preference.
  ///
  /// In en, this message translates to:
  /// **'Seat Preference'**
  String get seat_preference;

  /// No description provided for @meal_preference.
  ///
  /// In en, this message translates to:
  /// **'Meal Preference'**
  String get meal_preference;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @special_requests.
  ///
  /// In en, this message translates to:
  /// **'Special Requests'**
  String get special_requests;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'(Optional)'**
  String get optional;

  /// No description provided for @select_date.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get select_date;

  /// No description provided for @confirm_booking.
  ///
  /// In en, this message translates to:
  /// **'Confirm Booking'**
  String get confirm_booking;

  /// No description provided for @required_field.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get required_field;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
