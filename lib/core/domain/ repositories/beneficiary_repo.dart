import 'package:demo/core/domain/entity/top_up/top_up_history.dart';

import '../../data/base/result.dart';
import '../entity/beneficiary/beneficiary.dart';

abstract class BeneficiaryRepo {
  Future<Result<List<Beneficiary>>> getBeneficiaries();

  Future<Result<bool>> addBeneficiary({required Beneficiary beneficiary});

  Future<Result<bool>> removeBeneficiary({required String id});

  Future<Result<bool>> topUp(
      {required String beneficiaryId, required double amount});

  Future<Result<List<TopUpHistory>>> getTopUpHistory();
}
