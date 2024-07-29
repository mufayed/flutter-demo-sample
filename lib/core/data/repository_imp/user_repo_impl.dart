import 'package:demo/core/domain/%20repositories/user_repo.dart';

import '../../domain/entity/user/user.dart';
import '../base/result.dart';
import '../sources/app_service.dart';

class UserRepoImpl implements UserRepo {
  final AppService _service;

  UserRepoImpl(this._service);

  @override
  Future<Result<User>> getUser() async {
    return _service.getUser();
  }
}
