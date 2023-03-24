// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel extends Equatable{
  TodoModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dateTime,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? dateTime;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    dateTime: json["dateTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "dateTime": dateTime,
  };

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
