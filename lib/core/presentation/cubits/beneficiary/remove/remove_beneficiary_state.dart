part of 'remove_beneficiary_cubit.dart';

abstract class RemoveBeneficiaryState extends Equatable {
  const RemoveBeneficiaryState();

  @override
  List<Object> get props => [];
}

class RemoveBeneficiaryInitial extends RemoveBeneficiaryState {}

class RemoveBeneficiaryLoading extends RemoveBeneficiaryState {}

class RemoveBeneficiarySuccess extends RemoveBeneficiaryState {}

class RemoveBeneficiaryFailure extends RemoveBeneficiaryState {
  final String message;

  const RemoveBeneficiaryFailure(this.message);

  @override
  List<Object> get props => [message];
}