// presentation/cubit/remove_beneficiary_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/beneficiary/remove_beneficiary_usecase.dart';


part 'remove_beneficiary_state.dart';

class RemoveBeneficiaryCubit extends Cubit<RemoveBeneficiaryState> {
  final RemoveBeneficiaryUseCase _removeBeneficiaryUseCase;

  RemoveBeneficiaryCubit(this._removeBeneficiaryUseCase) : super(RemoveBeneficiaryInitial());

  Future<void> removeBeneficiary(String id) async {
    emit(RemoveBeneficiaryLoading());

    final result = await _removeBeneficiaryUseCase.call(id: id);

    if (result.isSuccess) {
      emit(RemoveBeneficiarySuccess());
    } else {
      emit(RemoveBeneficiaryFailure(result.message ?? 'An unknown error occurred'));
    }
  }
}
