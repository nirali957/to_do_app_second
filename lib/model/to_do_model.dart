class ToDoListModel {
  List<String>? tasklist;

  ToDoListModel({
    this.tasklist = const [],
  });

  factory ToDoListModel.fromJson(Map<String, dynamic> json) {
    return ToDoListModel(
      tasklist: json["data"],
    );
  }
}
