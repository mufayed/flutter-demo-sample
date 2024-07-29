// presentation/cubit/top_up_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecase/beneficiary/top_up_usecase.dart';

part 'top_up_state.dart';

class TopUpCubit extends Cubit<TopUpState> {
  final TopUpUseCase _topUpUseCase;

  TopUpCubit(this._topUpUseCase) : super(TopUpInitial());

  Future<void> topUp(String beneficiaryId, double amount) async {
    emit(TopUpLoading());

    final result = await _topUpUseCase.call(
      beneficiaryId: beneficiaryId,
      amount: amount,
    );

    if (result.isSuccess) {
      emit(TopUpSuccess());
    } else {
      emit(TopUpFailure(result.message ?? 'An unknown error occurred'));
    }
  }
}
