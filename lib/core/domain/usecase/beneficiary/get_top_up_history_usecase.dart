import 'package:demo/core/domain/entity/top_up/top_up_history.dart';

import '../../ repositories/beneficiary_repo.dart';
import '../../../data/base/result.dart';

class GetTopUpHistoryUsecase {
  final BeneficiaryRepo repository;

  GetTopUpHistoryUsecase(this.repository);

  Future<Result<List<TopUpHistory>>> call() {
    return repository.getTopUpHistory();
  }
}
