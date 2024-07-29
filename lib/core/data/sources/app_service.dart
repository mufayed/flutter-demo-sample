import 'package:demo/core/domain/entity/beneficiary/beneficiary.dart';
import '../../domain/entity/top_up/top_up_history.dart';
import '../../domain/entity/user/user.dart';
import '../base/result.dart';

class AppService {
  static const double MAX_UNVERIFIED_TOP_UP = 1000;
  static const double MAX_VERIFIED_TOP_UP = 500;
  static const double MAX_TOTAL_MONTHLY_TOP_UP = 3000;
  static const double TOP_UP_CHARGE = 1;

  User user;

  AppService(this.user);

  Result<User> getUser() {
    return Result.success(user);
  }

  Result<List<TopUpHistory>> getTopUpHistory() {
    return Result.success(user.topUpHistory);
  }

  Result<List<Beneficiary>> getBeneficiaries() {
    return Result.success(user.beneficiaries);
  }

  Result<bool> addBeneficiary(Beneficiary beneficiary) {
    if (user.beneficiaries.length >= 5) {
      return Result.error('Max beneficiaries reached');
    }
    if (beneficiary.nickname.length > 20) {
      return Result.error('Nickname too long');
    }
    if (user.beneficiaries
        .any((b) => b.phoneNumber == beneficiary.phoneNumber)) {
      return Result.error('Beneficiary already exists');
    }
    user.beneficiaries.add(beneficiary);
    return Result.success(true);
  }

  Result<bool> removeBeneficiary(String id) {
    user.beneficiaries.removeWhere((beneficiary) => beneficiary.id == id);
    return Result.success(true);
  }

  Result<bool> topUp(String beneficiaryId, double amount) {
    try {
      if (amount <= 0 || amount + TOP_UP_CHARGE > user.balance) {
        return Result.error('Invalid amount or insufficient balance');
      }

      Beneficiary? beneficiary = user.beneficiaries.firstWhere(
        (beneficiary) => beneficiary.id == beneficiaryId,
      );

      double maxTopUp =
          user.isVerified ? MAX_VERIFIED_TOP_UP : MAX_UNVERIFIED_TOP_UP;

      if (beneficiary.monthlyTopUpAmount + amount > maxTopUp) {
        return Result.error(
            'Exceeds monthly limit for ${beneficiary.nickname}');
      }

      if (user.totalMonthlyTopUp + amount > MAX_TOTAL_MONTHLY_TOP_UP) {
        return Result.error('Exceeds total monthly limit');
      }

      user.balance -= (amount + TOP_UP_CHARGE);
      beneficiary.monthlyTopUpAmount += amount;
      user.totalMonthlyTopUp += amount;

      // Save top-up transaction to history
      user.topUpHistory.add(TopUpHistory(
        date: DateTime.now(),
        beneficiaryNickname: beneficiary.nickname,
        amount: amount,
      ));

      return Result.success(true);
    } catch (e) {
      return Result.error('An error occurred');
    }
  }
}
