part of 'user_bloc_bloc.dart';

sealed class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserBlocEvent {}

class FetchData extends UserBlocEvent {

}

