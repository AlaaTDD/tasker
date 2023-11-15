// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int results;
  PaginationResult paginationResult;
  List<Datum> data;

  UserModel({
    required this.results,
    required this.paginationResult,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  String name;
  String email;
  String phone;
  String password;
  String role;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? passwordChangedAt;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.passwordChangedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    role: json["role"],
    active: json["active"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    passwordChangedAt: json["passwordChangedAt"] == null ? null : DateTime.parse(json["passwordChangedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "role": role,
    "active": active,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "passwordChangedAt": passwordChangedAt?.toIso8601String(),
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
