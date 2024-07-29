import '../../ repositories/beneficiary_repo.dart';
import '../../../data/base/result.dart';
import '../../entity/beneficiary/beneficiary.dart';

class GetBeneficiariesUseCase {
  final BeneficiaryRepo repository;

  GetBeneficiariesUseCase(this.repository);

  Future<Result<List<Beneficiary>>> call() {
    return repository.getBeneficiaries();
  }
}
