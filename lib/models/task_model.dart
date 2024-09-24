import 'dart:convert';

class TaskModel {
  String title;
  String? subtitle;
  bool iscompleted;
  DateTime createdat;

  TaskModel({
    required this.title,
    this.subtitle,
    this.iscompleted = false,
    required this.createdat,
  });

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        subtitle: json["subtitle"],
        iscompleted: json["iscompleted"],
        createdat: DateTime.parse(json["createdat"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "iscompleted": iscompleted,
        "createdat": createdat.toIso8601String(),
      };
}
