// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<TaskModel> taskModelFromJson(String str) =>
    List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String taskModelToJson(List<TaskModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
  String? title;
  DateTime? date;
  String? description;
  String? type;
  String? tag;
  Color? color;
  Color? textcolor;
  bool? isdone;

  TaskModel({
    this.title,
    this.date,
    this.description,
    this.type,
    this.tag,
    this.color,
    this.textcolor,
    this.isdone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        description: json["description"],
        type: json["type"],
        tag: json["tag"],
        color: json["color"] == null ? null : Color(json["color"]),
        textcolor: json["textcolor"] == null ? null : Color(json["textcolor"]),
        isdone: json["isdone"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date?.toIso8601String(),
        "description": description,
        "type": type,
        "tag": tag,
        "color": color?.value,
        "textcolor": textcolor?.value,
        "isdone": isdone,
      };
}
