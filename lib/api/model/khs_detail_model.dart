// To parse this JSON data, do
//
//     final khsDetailModel = khsDetailModelFromJson(jsonString);

import 'dart:convert';

KhsDetailModel khsDetailModelFromJson(String str) => KhsDetailModel.fromJson(json.decode(str));

String khsDetailModelToJson(KhsDetailModel data) => json.encode(data.toJson());

class KhsDetailModel {
    KhsDetailModel({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    int code;
    String errorMessage;
    Data data;

    factory KhsDetailModel.fromJson(Map<String, dynamic> json) => KhsDetailModel(
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
        required this.idSemester,
        required this.ip,
        required this.sksSemester,
        required this.listMataKuliah,
    });

    int idSemester;
    String ip;
    String sksSemester;
    List<ListMataKuliah> listMataKuliah;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        idSemester: json["id_semester"],
        ip: json["ip"],
        sksSemester: json["sks_semester"],
        listMataKuliah: List<ListMataKuliah>.from(json["list_mata_kuliah"].map((x) => ListMataKuliah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_semester": idSemester,
        "ip": ip,
        "sks_semester": sksSemester,
        "list_mata_kuliah": List<dynamic>.from(listMataKuliah.map((x) => x.toJson())),
    };
}

class ListMataKuliah {
    ListMataKuliah({
        required this.idKrs,
        required this.status,
        required this.idSemester,
        this.nilai,
        this.edom,
        required this.idMatakuliah,
        required this.namaMatakuliah,
        required this.kodeMatakuliah,
        required this.sksTotal,
        required this.kodeKelas,
        required this.idKelas,
        required this.jamMulai,
        required this.jamSelesai,
        required this.hari,
        required this.namaRuang,
        this.idPaketMbkm,
        this.namaPaketProgram,
        this.namaProgramMbkm,
    });

    int idKrs;
    String status;
    int idSemester;
    dynamic nilai;
    dynamic edom;
    int idMatakuliah;
    String namaMatakuliah;
    String kodeMatakuliah;
    String sksTotal;
    String kodeKelas;
    int idKelas;
    String jamMulai;
    String jamSelesai;
    int hari;
    String namaRuang;
    dynamic idPaketMbkm;
    dynamic namaPaketProgram;
    dynamic namaProgramMbkm;

    factory ListMataKuliah.fromJson(Map<String, dynamic> json) => ListMataKuliah(
        idKrs: json["id_krs"],
        status: json["status"],
        idSemester: json["id_semester"],
        nilai: json["nilai"],
        edom: json["edom"],
        idMatakuliah: json["id_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        sksTotal: json["sks_total"],
        kodeKelas: json["kode_kelas"],
        idKelas: json["id_kelas"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        hari: json["hari"],
        namaRuang: json["nama_ruang"],
        idPaketMbkm: json["id_paket_mbkm"],
        namaPaketProgram: json["nama_paket_program"],
        namaProgramMbkm: json["nama_program_mbkm"],
    );

    Map<String, dynamic> toJson() => {
        "id_krs": idKrs,
        "status": status,
        "id_semester": idSemester,
        "nilai": nilai,
        "edom": edom,
        "id_matakuliah": idMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "kode_matakuliah": kodeMatakuliah,
        "sks_total": sksTotal,
        "kode_kelas": kodeKelas,
        "id_kelas": idKelas,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "hari": hari,
        "nama_ruang": namaRuang,
        "id_paket_mbkm": idPaketMbkm,
        "nama_paket_program": namaPaketProgram,
        "nama_program_mbkm": namaProgramMbkm,
    };
}
