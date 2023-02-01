class ToDoListModel {
  final String? title;
  final String? date;
  final String? time;
  final String? description;

  ToDoListModel({
    this.title,
    this.date,
    this.time,
    this.description,
  });
  ToDoListModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        date = json['date'] as String?,
        time = json['time'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'time': time,
        'description': description,
      };
}
