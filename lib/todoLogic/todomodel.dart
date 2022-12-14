// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<TodoModel> todoFromJson(String str) =>
    List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoToJson(List<TodoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  TodoModel({
    required this.title,
    required this.isCompleted,
    required this.id,
  });

  final String title;

  final bool isCompleted;
  final String id;

  TodoModel copyWith({
    String? title,
    bool? isCompleted,
    String? id,
  }) =>
      TodoModel(
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted,
        id: id ?? this.id,
      );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        title: json["title"] as String,
        isCompleted: json["isCompleted"] as bool,
        id: json["id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "isCompleted": isCompleted,
        "id": id,
      };
}
