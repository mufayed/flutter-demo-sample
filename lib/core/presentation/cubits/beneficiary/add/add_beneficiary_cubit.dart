// presentation/cubit/add_beneficiary_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entity/beneficiary/beneficiary.dart';
import '../../../../domain/usecase/beneficiary/add_beneficiary_usecase.dart';

part 'add_beneficiary_state.dart';

class AddBeneficiaryCubit extends Cubit<AddBeneficiaryState> {
  final AddBeneficiaryUseCase _addBeneficiaryUseCase;

  AddBeneficiaryCubit(this._addBeneficiaryUseCase)
      : super(AddBeneficiaryInitial());

  Future<void> addBeneficiary({required Beneficiary beneficiary}) async {
    emit(AddBeneficiaryLoading());

    final result = await _addBeneficiaryUseCase.call(beneficiary: beneficiary);

    if (result.isSuccess) {
      emit(AddBeneficiarySuccess());
    } else {
      emit(
          AddBeneficiaryFailure(result.message ?? 'An unknown error occurred'));
    }
  }
}
