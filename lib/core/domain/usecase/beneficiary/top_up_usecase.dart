import '../../ repositories/beneficiary_repo.dart';
import '../../../data/base/result.dart';

class TopUpUseCase {
  final BeneficiaryRepo repository;

  TopUpUseCase(this.repository);

  Future<Result<bool>> call(
      {required String beneficiaryId, required double amount}) {
    return repository.topUp(beneficiaryId: beneficiaryId, amount: amount);
  }
}
