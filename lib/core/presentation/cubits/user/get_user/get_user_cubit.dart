import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecase/user/get_user_usecase.dart';
import 'get_user_state.dart';



class GetUserCubit extends Cubit<GetUserState> {
  final GetUserUseCase _getUserUseCase;

  GetUserCubit(this._getUserUseCase) : super(GetUserInitial());

  Future<void> getUser() async {
    emit(GetUserLoading());

    final result = await _getUserUseCase.call();

    if (result.isSuccess) {
      emit(GetUserSuccess(result.data!));
    } else {
      emit(GetUserFailure(result.message ?? 'An unknown error occurred'));
    }
  }
}