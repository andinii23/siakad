// To parse this JSON data, do
//
//     final kurikulumModel = kurikulumModelFromJson(jsonString);

import 'dart:convert';

KurikulumModel kurikulumModelFromJson(String str) => KurikulumModel.fromJson(json.decode(str));

String kurikulumModelToJson(KurikulumModel data) => json.encode(data.toJson());

class KurikulumModel {
    KurikulumModel({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    int code;
    String errorMessage;
    Data data;

    factory KurikulumModel.fromJson(Map<String, dynamic> json) => KurikulumModel(
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
    ListClass list;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        perPage: json["per_page"],
        page: json["page"],
        list: ListClass.fromJson(json["list"]),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "page": page,
        "list": list.toJson(),
    };
}

class ListClass {
    ListClass({
        required this.idKurikulum,
        required this.namaKurikulum,
        required this.jumlahSemesterNormal,
        required this.jumlahSksWajib,
        required this.jumlahSksPilihan,
        required this.totalSks,
        required this.sksSelesai,
        required this.listMataKuliah,
    });

    int idKurikulum;
    String namaKurikulum;
    int jumlahSemesterNormal;
    String jumlahSksWajib;
    String jumlahSksPilihan;
    String totalSks;
    int sksSelesai; 
    List<ListMataKuliah> listMataKuliah;

    factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        idKurikulum: json["id_kurikulum"],
        namaKurikulum: json["nama_kurikulum"],
        jumlahSemesterNormal: json["jumlah_semester_normal"],
        jumlahSksWajib: json["jumlah_sks_wajib"],
        jumlahSksPilihan: json["jumlah_sks_pilihan"],
        totalSks: json["total_sks"],
        sksSelesai: json["sks_selesai"],
        listMataKuliah: List<ListMataKuliah>.from(json["list_mata_kuliah"].map((x) => ListMataKuliah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_kurikulum": idKurikulum,
        "nama_kurikulum": namaKurikulum,
        "jumlah_semester_normal": jumlahSemesterNormal,
        "jumlah_sks_wajib": jumlahSksWajib,
        "jumlah_sks_pilihan": jumlahSksPilihan,
        "total_sks": totalSks,
        "sks_selesai": sksSelesai,
        "list_mata_kuliah": List<dynamic>.from(listMataKuliah.map((x) => x.toJson())),
    };
}

class ListMataKuliah {
    ListMataKuliah({
        required this.wajib,
        required this.semester,
        required this.idMatakuliah,
        required this.kodeMatakuliah,
        required this.namaMatakuliah,
        this.oldNamaMatakuliah,
        required this.sksTotal,
        required this.sksTatapMuka,
        this.sksPraktek,
        this.sksLapangan,
        this.sksSimulasi,
    });

    String wajib;
    int semester;
    int idMatakuliah;
    String kodeMatakuliah;
    String namaMatakuliah;
    String? oldNamaMatakuliah;
    String sksTotal;
    String sksTatapMuka;
    String? sksPraktek;
    String? sksLapangan;
    String? sksSimulasi;

    factory ListMataKuliah.fromJson(Map<String, dynamic> json) => ListMataKuliah(
        wajib: json["wajib"],
        semester: json["semester"],
        idMatakuliah: json["id_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        oldNamaMatakuliah: json["old_nama_matakuliah"],
        sksTotal: json["sks_total"],
        sksTatapMuka: json["sks_tatap_muka"],
        sksPraktek: json["sks_praktek"],
        sksLapangan: json["sks_lapangan"],
        sksSimulasi: json["sks_simulasi"],
    );

    Map<String, dynamic> toJson() => {
        "wajib": wajib,
        "semester": semester,
        "id_matakuliah": idMatakuliah,
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "old_nama_matakuliah": oldNamaMatakuliah,
        "sks_total": sksTotal,
        "sks_tatap_muka": sksTatapMuka,
        "sks_praktek": sksPraktek,
        "sks_lapangan": sksLapangan,
        "sks_simulasi": sksSimulasi,
    };
    
}
