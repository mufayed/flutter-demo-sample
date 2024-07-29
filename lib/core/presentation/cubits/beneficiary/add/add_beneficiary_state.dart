part of 'add_beneficiary_cubit.dart';

abstract class AddBeneficiaryState extends Equatable {
  const AddBeneficiaryState();

  @override
  List<Object> get props => [];
}

class AddBeneficiaryInitial extends AddBeneficiaryState {}

class AddBeneficiaryLoading extends AddBeneficiaryState {}

class AddBeneficiarySuccess extends AddBeneficiaryState {}

class AddBeneficiaryFailure extends AddBeneficiaryState {
  final String message;

  const AddBeneficiaryFailure(this.message);

  @override
  List<Object> get props => [message];
}
