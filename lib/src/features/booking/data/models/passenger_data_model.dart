class PassengerData {
  final String fullName;
  final String passportNumber;
  final DateTime? passportExpiry;
  final String contactEmail;
  final String contactPhone;
  final String? specialRequests;

  const PassengerData({
    required this.fullName,
    required this.passportNumber,
    this.passportExpiry,
    required this.contactEmail,
    required this.contactPhone,
    this.specialRequests,
  });

  Map<String,dynamic>toJson(){
    return {
      'name':fullName,
      "passport_number":passportNumber,
      "passport_expiry":passportExpiry,
      "email":contactEmail,
      "phone":contactPhone,
      "special_requests":specialRequests
    };
  }
}