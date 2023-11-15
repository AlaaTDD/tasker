// To parse this JSON data, do
//
//     final subtaskModel = subtaskModelFromJson(jsonString);

import 'dart:convert';

SubtaskModel subtaskModelFromJson(String str) => SubtaskModel.fromJson(json.decode(str));

String subtaskModelToJson(SubtaskModel data) => json.encode(data.toJson());

class SubtaskModel {
  int results;
  PaginationResult paginationResult;
  List<DatumSub> data;

  SubtaskModel({
    required this.results,
    required this.paginationResult,
    required this.data,
  });

  factory SubtaskModel.fromJson(Map<String, dynamic> json) => SubtaskModel(
    results: json["results"],
    paginationResult: PaginationResult.fromJson(json["paginationResult"]),
    data: List<DatumSub>.from(json["data"].map((x) => DatumSub.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results,
    "paginationResult": paginationResult.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumSub {
  String id;
  String taskId;
  String managerId;
  String title;
  String eName;
  List<String> description;
  List<String> fileUpload;
  DateTime createdAt;
  DateTime updatedAt;
  String? actionName;

  DatumSub({
    required this.id,
    required this.taskId,
    required this.managerId,
    required this.title,
    required this.eName,
    required this.description,
    required this.fileUpload,
    required this.createdAt,
    required this.updatedAt,
    this.actionName,
  });

  factory DatumSub.fromJson(Map<String, dynamic> json) => DatumSub(
    id: json["_id"],
    taskId: json["task_id"],
    managerId: json["manager_id"],
    title: json["title"],
    eName: json["e_name"],
    description: List<String>.from(json["description"].map((x) => x)),
    fileUpload: List<String>.from(json["file_upload"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    actionName: json["action_name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "task_id": taskId,
    "manager_id": managerId,
    "title": title,
    "e_name": eName,
    "description": List<dynamic>.from(description.map((x) => x)),
    "file_upload": List<dynamic>.from(fileUpload.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "action_name": actionName,
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
