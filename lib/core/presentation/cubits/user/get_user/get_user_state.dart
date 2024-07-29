import 'package:equatable/equatable.dart';

import '../../../../domain/entity/user/user.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final User user;

  GetUserSuccess(this.user);
}

class GetUserFailure extends GetUserState {
  final String message;

  GetUserFailure(this.message);
}
