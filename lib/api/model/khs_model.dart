// To parse this JSON data, do
//
//     final khsModel = khsModelFromJson(jsonString);

import 'dart:convert';

KhsModel khsModelFromJson(String str) => KhsModel.fromJson(json.decode(str));

String khsModelToJson(KhsModel data) => json.encode(data.toJson());

class KhsModel {
    KhsModel({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    int code;
    String errorMessage;
    Data data;

    factory KhsModel.fromJson(Map<String, dynamic> json) => KhsModel(
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
    Data({
        required this.total,
        required this.perPage,
        required this.page,
        required this.list,
    });

    int total;
    int perPage;
    int page;
    List<ListElement> list;

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
    ListElement({
        required this.semester,
        required this.listMataKuliah,
    });

    int semester;
    List<ListMataKuliah> listMataKuliah;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        semester: json["semester"],
        listMataKuliah: List<ListMataKuliah>.from(json["list_mata_kuliah"].map((x) => ListMataKuliah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "semester": semester,
        "list_mata_kuliah": List<dynamic>.from(listMataKuliah.map((x) => x.toJson())),
    };
}

class ListMataKuliah {
    ListMataKuliah({
        required this.idKrs,
        required this.status,
        required this.idSemester,
        required this.nilai,
        required this.edom,
        required this.namaMatakuliah,
        required this.kodeMatakuliah,
        required this.sksTotal,
    });

    int idKrs;
    String status;
    int idSemester;
    String nilai;
    String edom;
    String namaMatakuliah;
    String kodeMatakuliah;
    String sksTotal;

    factory ListMataKuliah.fromJson(Map<String, dynamic> json) => ListMataKuliah(
        idKrs: json["id_krs"],
        status: json["status"],
        idSemester: json["id_semester"],
        nilai: json["nilai"],
        edom: json["edom"],
        namaMatakuliah: json["nama_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        sksTotal: json["sks_total"],
    );

    Map<String, dynamic> toJson() => {
        "id_krs": idKrs,
        "status": status,
        "id_semester": idSemester,
        "nilai": nilai,
        "edom": edom,
        "nama_matakuliah": namaMatakuliah,
        "kode_matakuliah": kodeMatakuliah,
        "sks_total": sksTotal,
    };
}


