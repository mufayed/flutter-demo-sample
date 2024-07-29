import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/beneficiary/beneficiary.dart';
import '../../../../domain/usecase/beneficiary/get_beneficiaries_usecase.dart';

part 'get_beneficiaries_state.dart';

class GetBeneficiariesCubit extends Cubit<GetBeneficiariesState> {
  final GetBeneficiariesUseCase _getBeneficiariesUseCase;

  GetBeneficiariesCubit(this._getBeneficiariesUseCase)
      : super(GetBeneficiariesInitial());

  Future<void> getBeneficiaries() async {
    emit(GetBeneficiariesLoading());

    final result = await _getBeneficiariesUseCase.call();
    
    if (result.isSuccess) {
      emit(GetBeneficiariesSuccess(result.data!.reversed.toList()));
    } else {
      emit(GetBeneficiariesFailure(
          result.message ?? 'An unknown error occurred'));
    }
  }
}
