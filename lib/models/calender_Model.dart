// To parse this JSON data, do
//
//     final calenderModel = calenderModelFromJson(jsonString);

import 'dart:convert';

CalenderModel calenderModelFromJson(String str) => CalenderModel.fromJson(json.decode(str));

String calenderModelToJson(CalenderModel data) => json.encode(data.toJson());

class CalenderModel {
  int results;
  PaginationResult paginationResult;
  List<Datum> data;

  CalenderModel({
    required this.results,
    required this.paginationResult,
    required this.data,
  });

  factory CalenderModel.fromJson(Map<String, dynamic> json) => CalenderModel(
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
  TaskId? taskId;
  String managerId;
  String employeeId;
  DateTime startDate;
  DateTime dueDate;
  DateTime createdAt;
  DateTime updatedAt;
  String? filterdate;

  Datum({
    required this.id,
    required this.taskId,
    required this.managerId,
    required this.employeeId,
    required this.startDate,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    this.filterdate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    taskId: json["task_id"] == null ? null : TaskId.fromJson(json["task_id"]),
    managerId: json["manager_id"],
    employeeId: json["employee_id"],
    startDate: DateTime.parse(json["start_date"]),
    dueDate: DateTime.parse(json["due_date"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    filterdate: json["filterdate"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "task_id": taskId?.toJson(),
    "manager_id": managerId,
    "employee_id": employeeId,
    "start_date": startDate.toIso8601String(),
    "due_date": dueDate.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "filterdate": filterdate,
  };
}

class TaskId {
  String id;
  EmployeeId employeeId;
  String title;

  TaskId({
    required this.id,
    required this.employeeId,
    required this.title,
  });

  factory TaskId.fromJson(Map<String, dynamic> json) => TaskId(
    id: json["_id"],
    employeeId: EmployeeId.fromJson(json["employee_id"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee_id": employeeId.toJson(),
    "title": title,
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
