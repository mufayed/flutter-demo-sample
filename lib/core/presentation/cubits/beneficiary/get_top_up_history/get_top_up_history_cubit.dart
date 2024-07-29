import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecase/beneficiary/get_top_up_history_usecase.dart';
import 'get_top_up_history_state.dart';

class GetTopUpHistoryCubit extends Cubit<GetTopUpHistoryState> {
  final GetTopUpHistoryUsecase getTopUpHistoryUsecase;

  GetTopUpHistoryCubit(this.getTopUpHistoryUsecase)
      : super(GetTopUpHistoryInitial());

  Future<void> fetchTopUpHistory() async {
    emit(GetTopUpHistoryLoading());

    final result = await getTopUpHistoryUsecase.call();

    if (result.isSuccess) {
      emit(GetTopUpHistorySuccess(result.data?.reversed.toList() ?? []));
    } else {
      emit(GetTopUpHistoryFailure(
          result.message ?? 'An unknown error occurred'));
    }
  }
}
