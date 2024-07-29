part of 'get_beneficiaries_cubit.dart';

abstract class GetBeneficiariesState extends Equatable {
  const GetBeneficiariesState();

  @override
  List<Object> get props => [];
}

class GetBeneficiariesInitial extends GetBeneficiariesState {}

class GetBeneficiariesLoading extends GetBeneficiariesState {}

class GetBeneficiariesSuccess extends GetBeneficiariesState {
  final List<Beneficiary> beneficiaries;

  const GetBeneficiariesSuccess(this.beneficiaries);

  @override
  List<Object> get props => [beneficiaries];
}

class GetBeneficiariesFailure extends GetBeneficiariesState {
  final String message;

  const GetBeneficiariesFailure(this.message);

  @override
  List<Object> get props => [message];
}
