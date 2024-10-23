import 'dart:convert';

import 'package:_one/model/httpModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../RouterPages/router_pages.dart';
import '../model/blocModel.dart';
import '../server/http_server.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  List<TaskListModel> taskList = [];
  UserBlocBloc() : super(UserBlocInitial()) {
    on<FetchData>((event, emit) async {
      taskList = await getList();
      emit(UserBlocLoaded(taskList: taskList));
    });
  }
  getList() async {
    var response = await HttpService.httpGet(RouteConstants.taskList);
    var responseJson = jsonDecode(response.body);
    Iterable list = responseJson;
    List<TaskListModel> taskList =
        list.map((data) => TaskListModel.fromJson(data)).toList();
    return taskList;
  }
}
