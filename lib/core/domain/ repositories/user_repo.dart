import 'package:demo/core/domain/entity/user/user.dart';
import '../../data/base/result.dart';


abstract class UserRepo {
  Future<Result<User>> getUser();
}
