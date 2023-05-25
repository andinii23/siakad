// To parse this JSON data, do
//
//     final semesterMhs = semesterMhsFromJson(jsonString);

import 'dart:convert';

SemesterMhs semesterMhsFromJson(String str) => SemesterMhs.fromJson(json.decode(str));

String semesterMhsToJson(SemesterMhs data) => json.encode(data.toJson());

class SemesterMhs {
    int code;
    String errorMessage;
    Data data;

    SemesterMhs({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    factory SemesterMhs.fromJson(Map<String, dynamic> json) => SemesterMhs(
        code: json["code"],
        errorMessage: json["error_message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "error_message": errorMessage,
        "data": data.toJson(),
    };
}

class Data {
    int total;
    int perPage;
    int page;
    List<ListElement> list;

    Data({
        required this.total,
        required this.perPage,
        required this.page,
        required this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        perPage: json["per_page"],
        page: json["page"],
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "page": page,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
    };
}

class ListElement {
    String idSemester;
    String semesterText;

    ListElement({
        required this.idSemester,
        required this.semesterText,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        idSemester: json["id_semester"],
        semesterText: json["semester_text"],
    );

    Map<String, dynamic> toJson() => {
        "id_semester": idSemester,
        "semester_text": semesterText,
    };
}
