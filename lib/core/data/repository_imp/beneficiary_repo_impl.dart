import 'package:demo/core/domain/entity/top_up/top_up_history.dart';

import '../../domain/ repositories/beneficiary_repo.dart';
import '../../domain/entity/beneficiary/beneficiary.dart';
import '../base/result.dart';
import '../sources/app_service.dart';

class BeneficiaryRepoImpl implements BeneficiaryRepo {
  final AppService _service;

  BeneficiaryRepoImpl(this._service);

  @override
  Future<Result<List<Beneficiary>>> getBeneficiaries() async {
    return _service.getBeneficiaries();
  }

  @override
  Future<Result<bool>> addBeneficiary(
      {required Beneficiary beneficiary}) async {
    return _service.addBeneficiary(beneficiary);
  }

  @override
  Future<Result<bool>> removeBeneficiary({required String id}) async {
    return _service.removeBeneficiary(id);
  }

  @override
  Future<Result<bool>> topUp(
      {required String beneficiaryId, required double amount}) async {
    return _service.topUp(beneficiaryId, amount);
  }

  @override
  Future<Result<List<TopUpHistory>>> getTopUpHistory() async {
    return _service.getTopUpHistory();
  }
}
