import 'package:equatable/equatable.dart';

import '../../../../domain/entity/top_up/top_up_history.dart';


abstract class GetTopUpHistoryState extends Equatable {
  const GetTopUpHistoryState();

  @override
  List<Object> get props => [];
}

class GetTopUpHistoryInitial extends GetTopUpHistoryState {}

class GetTopUpHistoryLoading extends GetTopUpHistoryState {}

class GetTopUpHistorySuccess extends GetTopUpHistoryState {
  final List<TopUpHistory> history;

  const GetTopUpHistorySuccess(this.history);

  @override
  List<Object> get props => [history];
}

class GetTopUpHistoryFailure extends GetTopUpHistoryState {
  final String message;

  const GetTopUpHistoryFailure(this.message);

  @override
  List<Object> get props => [message];
}
