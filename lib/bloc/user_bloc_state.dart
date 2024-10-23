part of 'user_bloc_bloc.dart';

sealed class UserBlocState extends Equatable {
  const UserBlocState();
  
  @override
  List<Object> get props => [];
}

final class UserBlocInitial extends UserBlocState {}
final class UserBlocLoaded extends UserBlocState {
  final List<TaskListModel> taskList;
  const UserBlocLoaded({required this.taskList});
  @override 
  List<Object> get props => [taskList];
}
