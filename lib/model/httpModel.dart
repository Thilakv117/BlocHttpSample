class TaskListModel {
  String? id;
  String? title;
  bool? completed;

  TaskListModel({this.id, this.title, this.completed});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['description'];
    completed = json['completed'];
  }
 
}