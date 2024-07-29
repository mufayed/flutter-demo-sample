class Beneficiary {
  final String nickname;
  final String id; // Unique identifier for each beneficiary
  final String phoneNumber; // Added phone number
  double monthlyTopUpAmount;

  Beneficiary({
    required this.nickname,
    required this.id,
    required this.phoneNumber,
    this.monthlyTopUpAmount = 0,
  });
}