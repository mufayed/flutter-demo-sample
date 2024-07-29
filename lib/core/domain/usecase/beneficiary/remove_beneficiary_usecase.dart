import '../../ repositories/beneficiary_repo.dart';
import '../../../data/base/result.dart';

class RemoveBeneficiaryUseCase {
  final BeneficiaryRepo repository;

  RemoveBeneficiaryUseCase(this.repository);

  Future<Result<bool>> call({required String id}) {
    return repository.removeBeneficiary(id: id);
  }
}
