import '../beneficiary/beneficiary.dart';
import '../top_up/top_up_history.dart';

class User {
  String name;
  bool isVerified;
  double balance;
  double totalMonthlyTopUp;
  List<Beneficiary> beneficiaries;
  List<TopUpHistory> topUpHistory;

  User({
    required this.name,
    required this.isVerified,
    required this.balance,
    required this.totalMonthlyTopUp,
    required this.beneficiaries,
    required this.topUpHistory,
  });

  User.empty()
      : name = '',
        isVerified = false,
        balance = 0,
        totalMonthlyTopUp = 0,
        beneficiaries = [],
        topUpHistory = [];
}
