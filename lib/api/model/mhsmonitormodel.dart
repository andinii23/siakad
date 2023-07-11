// To parse this JSON data, do
//
//     final mahasiswaMonitor = mahasiswaMonitorFromJson(jsonString);

import 'dart:convert';

MahasiswaMonitor mahasiswaMonitorFromJson(String str) => MahasiswaMonitor.fromJson(json.decode(str));

String mahasiswaMonitorToJson(MahasiswaMonitor data) => json.encode(data.toJson());

class MahasiswaMonitor {
    int code;
    String errorMessage;
    Data data;

    MahasiswaMonitor({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    factory MahasiswaMonitor.fromJson(Map<String, dynamic> json) => MahasiswaMonitor(
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
    ListClass list;

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
    int idMonitoringPerkuliahan;
    int idKelas;
    dynamic pertemuanKe;
    DateTime tanggal;
    String jamMulai;
    String jamSelesai;
    String materi;
    String dosen;
    String jamMulaiKuliah;
    String jamSelesaiKuliah;
    int hari;
    String kodeMatakuliah;
    String namaMatakuliah;
    List<Mahasiswa> mahasiswa;

    ListClass({
        required this.idMonitoringPerkuliahan,
        required this.idKelas,
        this.pertemuanKe,
        required this.tanggal,
        required this.jamMulai,
        required this.jamSelesai,
        required this.materi,
        required this.dosen,
        required this.jamMulaiKuliah,
        required this.jamSelesaiKuliah,
        required this.hari,
        required this.kodeMatakuliah,
        required this.namaMatakuliah,
        required this.mahasiswa,
    });

    factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        idMonitoringPerkuliahan: json["id_monitoring_perkuliahan"],
        idKelas: json["id_kelas"],
        pertemuanKe: json["pertemuan_ke"],
        tanggal: DateTime.parse(json["tanggal"]),
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        materi: json["materi"],
        dosen: json["dosen"],
        jamMulaiKuliah: json["jam_mulai_kuliah"],
        jamSelesaiKuliah: json["jam_selesai_kuliah"],
        hari: json["hari"],
        kodeMatakuliah: json["kode_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        mahasiswa: List<Mahasiswa>.from(json["mahasiswa"].map((x) => Mahasiswa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_monitoring_perkuliahan": idMonitoringPerkuliahan,
        "id_kelas": idKelas,
        "pertemuan_ke": pertemuanKe,
        "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "materi": materi,
        "dosen": dosen,
        "jam_mulai_kuliah": jamMulaiKuliah,
        "jam_selesai_kuliah": jamSelesaiKuliah,
        "hari": hari,
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "mahasiswa": List<dynamic>.from(mahasiswa.map((x) => x.toJson())),
    };
}

class Mahasiswa {
    int idMhsPt;
    String noMhs;
    String angkatan;
    String namaMahasiswa;
    String idProdi;
    String namaProdi;
    int kehadiran;

    Mahasiswa({
        required this.idMhsPt,
        required this.noMhs,
        required this.angkatan,
        required this.namaMahasiswa,
        required this.idProdi,
        required this.namaProdi,
        required this.kehadiran,
    });

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        idMhsPt: json["id_mhs_pt"],
        noMhs: json["no_mhs"],
        angkatan: json["angkatan"],
        namaMahasiswa: json["nama_mahasiswa"],
        idProdi: json["id_prodi"],
        namaProdi: json["nama_prodi"],
        kehadiran: json["kehadiran"],
    );

    Map<String, dynamic> toJson() => {
        "id_mhs_pt": idMhsPt,
        "no_mhs": noMhs,
        "angkatan": angkatan,
        "nama_mahasiswa": namaMahasiswa,
        "id_prodi": idProdi,
        "nama_prodi": namaProdi,
        "kehadiran": kehadiran,
    };
}


