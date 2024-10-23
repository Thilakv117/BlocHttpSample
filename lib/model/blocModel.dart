import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final fetchdata;
  UserModel({required this.fetchdata});
  @override 
  List<Object?> get props => [fetchdata];
  static List<UserModel> userModel = [
    UserModel(fetchdata: " ", )
  ];
}