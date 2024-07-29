import 'package:demo/core/domain/%20repositories/user_repo.dart';
import 'package:demo/core/domain/entity/user/user.dart';
import '../../../data/base/result.dart';

class GetUserUseCase {
  final UserRepo repository;

  GetUserUseCase(this.repository);

  Future<Result<User>> call() {
    return repository.getUser();
  }
}
