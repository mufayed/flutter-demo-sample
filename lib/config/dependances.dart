import 'package:demo/core/data/repository_imp/beneficiary_repo_impl.dart';
import 'package:demo/core/data/repository_imp/user_repo_impl.dart';
import 'package:demo/core/data/sources/app_service.dart';
import 'package:demo/core/domain/%20repositories/beneficiary_repo.dart';
import 'package:demo/core/domain/%20repositories/user_repo.dart';
import 'package:demo/core/domain/entity/user/user.dart';
import 'package:demo/core/domain/usecase/beneficiary/add_beneficiary_usecase.dart';
import 'package:demo/core/domain/usecase/beneficiary/get_beneficiaries_usecase.dart';
import 'package:demo/core/domain/usecase/beneficiary/get_top_up_history_usecase.dart';
import 'package:demo/core/domain/usecase/beneficiary/top_up_usecase.dart';
import 'package:demo/core/domain/usecase/user/get_user_usecase.dart';
import 'package:get_it/get_it.dart';

import '../core/domain/usecase/beneficiary/remove_beneficiary_usecase.dart';

final locator = GetIt.instance;

loadDependencies() async {
  _registerApis();
  _registerUsecases();
  _registerRepositories();
}

_registerApis() {
  // Main AppService
  locator.registerLazySingleton<AppService>(() => AppService(User(
      name: 'John Doe',
      isVerified: true,
      balance: 5000,
      totalMonthlyTopUp: 0,
      beneficiaries: [],
      topUpHistory: [])));
}

_registerRepositories() {
  // User repository
  locator.registerLazySingleton<UserRepo>(() => UserRepoImpl(
        locator(),
      ));

  // Beneficiary repository
  locator.registerLazySingleton<BeneficiaryRepo>(() => BeneficiaryRepoImpl(
        locator(),
      ));
}

_registerUsecases() {
  // User usecase
  locator
      .registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(locator()));

  // Beneficiary usecase
  locator.registerLazySingleton<GetBeneficiariesUseCase>(
      () => GetBeneficiariesUseCase(locator()));
  locator.registerLazySingleton<AddBeneficiaryUseCase>(
      () => AddBeneficiaryUseCase(locator()));
  locator.registerLazySingleton<RemoveBeneficiaryUseCase>(
      () => RemoveBeneficiaryUseCase(locator()));
  locator.registerLazySingleton<TopUpUseCase>(() => TopUpUseCase(locator()));
  locator.registerLazySingleton<GetTopUpHistoryUsecase>(
      () => GetTopUpHistoryUsecase(locator()));
}
