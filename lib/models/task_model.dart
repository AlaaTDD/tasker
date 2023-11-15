// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  int results;
  PaginationResult paginationResult;
  List<Datum> data;

  TaskModel({
    required this.results,
    required this.paginationResult,
    required this.data,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    results: json["results"],
    paginationResult: PaginationResult.fromJson(json["paginationResult"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results,
    "paginationResult": paginationResult.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String managerId;
  EmployeeId employeeId;
  int numofsubtask;
  String title;
  DateTime startDate;
  DateTime dueDate;
  int priority;
  String description;
  List<String> fileUpload;
  DateTime createdAt;
  DateTime updatedAt;
  int status;

  Datum({
    required this.id,
    required this.managerId,
    required this.employeeId,
    required this.numofsubtask,
    required this.title,
    required this.startDate,
    required this.dueDate,
    required this.priority,
    required this.description,
    required this.fileUpload,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    managerId: json["manager_id"],
    employeeId: EmployeeId.fromJson(json["employee_id"]),
    numofsubtask: json["numofsubtask"],
    title: json["title"],
    startDate: DateTime.parse(json["start_date"]),
    dueDate: DateTime.parse(json["due_date"]),
    priority: json["Priority"],
    description: json["description"],
    fileUpload: List<String>.from(json["file_upload"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "manager_id": managerId,
    "employee_id": employeeId.toJson(),
    "numofsubtask": numofsubtask,
    "title": title,
    "start_date": startDate.toIso8601String(),
    "due_date": dueDate.toIso8601String(),
    "Priority": priority,
    "description": description,
    "file_upload": List<dynamic>.from(fileUpload.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "status": status,
  };
}

class EmployeeId {
  String id;
  String name;

  EmployeeId({
    required this.id,
    required this.name,
  });

  factory EmployeeId.fromJson(Map<String, dynamic> json) => EmployeeId(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class PaginationResult {
  int currentPage;
  int limit;
  int numberOfPages;

  PaginationResult({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
  });

  factory PaginationResult.fromJson(Map<String, dynamic> json) => PaginationResult(
    currentPage: json["currentPage"],
    limit: json["limit"],
    numberOfPages: json["numberOfPages"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "limit": limit,
    "numberOfPages": numberOfPages,
  };
}
