import 'package:_one/bloc/user_bloc_bloc.dart';
import 'package:_one/model/httpModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskListModel> lists = [];
  UserBlocBloc userBlocBloc=UserBlocBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample bloc app"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(child:
          BlocBuilder<UserBlocBloc, UserBlocState>(builder: (context, state) {
            if(state is UserBlocLoaded){
              lists=state.taskList;
return ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context, index) {
              
                final list = lists[index];
                return Text("${list.title}");
          
            });
            }else{
              return CircularProgressIndicator();
            }
        
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBlocBloc>()..add(FetchData());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
