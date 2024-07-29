part of 'top_up_cubit.dart';

abstract class TopUpState extends Equatable {
  const TopUpState();

  @override
  List<Object> get props => [];
}

class TopUpInitial extends TopUpState {}

class TopUpLoading extends TopUpState {}

class TopUpSuccess extends TopUpState {}

class TopUpFailure extends TopUpState {
  final String message;

  const TopUpFailure(this.message);

  @override
  List<Object> get props => [message];
}
