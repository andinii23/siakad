// To parse this JSON data, do
//
//     final presensiModel = presensiModelFromJson(jsonString);

import 'dart:convert';

PresensiModel presensiModelFromJson(String str) => PresensiModel.fromJson(json.decode(str));

String presensiModelToJson(PresensiModel data) => json.encode(data.toJson());

class PresensiModel {
    PresensiModel({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    int code;
    String errorMessage;
    Data data;

    factory PresensiModel.fromJson(Map<String, dynamic> json) => PresensiModel(
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
        required this.idMatakuliah,
        required this.kodeMatakuliah,
        required this.namaMatakuliah,
        required this.jumlahPertemuan,
        required this.sksTotal,
        required this.krsStatus,
        required this.kelas,
        required this.dosen,
        required this.jumlahMasuk,
        required this.jumlahIzin,
        required this.jumlahAbsen,
    });

    int idMatakuliah;
    String kodeMatakuliah;
    String namaMatakuliah;
    int jumlahPertemuan;
    String sksTotal;
    String krsStatus;
    Kelas kelas;
    List<Dosen> dosen;
    int jumlahMasuk;
    int jumlahIzin;
    int jumlahAbsen;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        idMatakuliah: json["id_matakuliah"],
        kodeMatakuliah: json["kode_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        jumlahPertemuan: json["jumlah_pertemuan"],
        sksTotal: json["sks_total"],
        krsStatus: json["krs_status"],
        kelas: Kelas.fromJson(json["kelas"]),
        dosen: List<Dosen>.from(json["dosen"].map((x) => Dosen.fromJson(x))),
        jumlahMasuk: json["jumlah_masuk"],
        jumlahIzin: json["jumlah_izin"],
        jumlahAbsen: json["jumlah_absen"],
    );

    Map<String, dynamic> toJson() => {
        "id_matakuliah": idMatakuliah,
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "jumlah_pertemuan": jumlahPertemuan,
        "sks_total": sksTotal,
        "krs_status": krsStatus,
        "kelas": kelas.toJson(),
        "dosen": List<dynamic>.from(dosen.map((x) => x.toJson())),
        "jumlah_masuk": jumlahMasuk,
        "jumlah_izin": jumlahIzin,
        "jumlah_absen": jumlahAbsen,
    };
}

class Dosen {
    Dosen({
        required this.idPegawai,
        required this.namaPegawai,
        this.gelarDepan,
        required this.gelarBelakang,
    });

    int idPegawai;
    String namaPegawai;
    String? gelarDepan;
    String gelarBelakang;

    factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        idPegawai: json["id_pegawai"],
        namaPegawai: json["nama_pegawai"],
        gelarDepan: json["gelar_depan"],
        gelarBelakang: json["gelar_belakang"],
    );

    Map<String, dynamic> toJson() => {
        "id_pegawai": idPegawai,
        "nama_pegawai": namaPegawai,
        "gelar_depan": gelarDepan,
        "gelar_belakang": gelarBelakang,
    };
}

class Kelas {
    Kelas({
        required this.idKelas,
        required this.kodeKelas,
        required this.namaRuang,
        required this.hari,
        required this.jamMulai,
        required this.jamSelesai,
    });

    int idKelas;
    String kodeKelas;
    String namaRuang;
    String hari;
    String jamMulai;
    String jamSelesai;

    factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        idKelas: json["id_kelas"],
        kodeKelas: json["kode_kelas"],
        namaRuang: json["nama_ruang"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
    );

    Map<String, dynamic> toJson() => {
        "id_kelas": idKelas,
        "kode_kelas": kodeKelas,
        "nama_ruang": namaRuang,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
    };
}
