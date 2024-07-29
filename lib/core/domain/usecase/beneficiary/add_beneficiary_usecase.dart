import '../../ repositories/beneficiary_repo.dart';
import '../../../data/base/result.dart';
import '../../entity/beneficiary/beneficiary.dart';

class AddBeneficiaryUseCase {
  final BeneficiaryRepo repository;

  AddBeneficiaryUseCase(this.repository);

  Future<Result<bool>> call({required Beneficiary beneficiary}) {
    return repository.addBeneficiary(beneficiary: beneficiary);
  }
}
