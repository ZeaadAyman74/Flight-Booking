import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get search_flights => 'البحث عن الرحلات';

  @override
  String get find_flights => 'البحث عن رحلات طيران';

  @override
  String get where_would_you_like_to_fly => 'الي اين تريد السفر؟';

  @override
  String get search_for_best_flight_deals => 'البحث عن أفضل عروض رحلات الطيران';

  @override
  String get from => 'من';

  @override
  String get to => 'إلى';

  @override
  String get select_travel_date => 'تحديد تاريخ السفر';

  @override
  String get please_enter_departure_city => 'الرجاء إدخال مدينة المغادرة';

  @override
  String get please_enter_destination_city => 'الرجاء إدخال مدينة الوجهة';

  @override
  String get please_select_travel_date => 'يرجى تحديد تاريخ السفر';

  @override
  String get destination_must_be_different => 'يجب أن تكون الوجهة مختلفة';

  @override
  String get flights => 'الرحلات';

  @override
  String get no_flights_found => 'لم يتم العثور على رحلات';

  @override
  String get price => 'السعر';

  @override
  String get book_now => 'احجز الآن';

  @override
  String get arrival => 'الوصول';

  @override
  String get departure => 'المغادرة';

  @override
  String get total_price => 'السعر الإجمالي';

  @override
  String get passenger_details => 'تفاصيل المسافر';

  @override
  String get full_name => 'الاسم الكامل';

  @override
  String get passport_number => 'رقم جواز السفر';

  @override
  String get expiry_date => 'تاريخ الانتهاء';

  @override
  String get seat_preference => 'تفضيل المقعد';

  @override
  String get meal_preference => 'تفضيل الوجبة';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get phone_number => 'رقم الهاتف';

  @override
  String get special_requests => 'طلبات خاصة';

  @override
  String get enter_valid_email => 'الرجاء إدخال عنوان بريد إلكتروني صالح';

  @override
  String get enter_valid_phone_number => 'الرجاء إدخال رقم هاتف صالح';

  @override
  String get enter_valid_passport_number => 'الرجاء إدخال رقم جواز سفر صالح';

  @override
  String get optional => '(اختياري)';

  @override
  String get select_date => 'اختر التاريخ';

  @override
  String get confirm_booking => 'تاكيد الحجز';

  @override
  String get required_field => 'هذا الحقل مطلوب';

  @override
  String get ok => 'حسنا';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get booking_confirmed => 'تم تأكيد الحجز';

  @override
  String get have_save_and_pleasant_journey => 'نتمنى لك رحلة آمنة وممتعة';

  @override
  String flight(Object flightNumber) {
    return '$flightNumber رحلة';
  }
}
