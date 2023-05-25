// To parse this JSON data, do
//
//     final detailKelasModel = detailKelasModelFromJson(jsonString);

import 'dart:convert';

DetailKelasModel detailKelasModelFromJson(String str) => DetailKelasModel.fromJson(json.decode(str));

String detailKelasModelToJson(DetailKelasModel data) => json.encode(data.toJson());

class DetailKelasModel {
    int code;
    String errorMessage;
    Data data;

    DetailKelasModel({
        required this.code,
        required this.errorMessage,
        required this.data,
    });

    factory DetailKelasModel.fromJson(Map<String, dynamic> json) => DetailKelasModel(
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
    int jumlahMahasiswaKontrak;
    int idKelas;
    String kodeKelas;
    String jamMulai;
    String jamSelesai;
    int hari;
    int idSemester;
    String semester;
    dynamic kapasitaas;
    RuangKuliah ruangKuliah;
    KelasProdi kelasProdi;
    Matakuliah matakuliah;
    List<Dosen> dosen;
    int statusKelas;
    int statusKapasitas;
    int statusJadwal;
    int statusBisaDikontrak;
    String statusKontrak;
    int statusSksMencukupi;
    int statusBolehMerdeka;
    int kesimpulan;

    ListClass({
        required this.jumlahMahasiswaKontrak,
        required this.idKelas,
        required this.kodeKelas,
        required this.jamMulai,
        required this.jamSelesai,
        required this.hari,
        required this.idSemester,
        required this.semester,
        this.kapasitaas,
        required this.ruangKuliah,
        required this.kelasProdi,
        required this.matakuliah,
        required this.dosen,
        required this.statusKelas,
        required this.statusKapasitas,
        required this.statusJadwal,
        required this.statusBisaDikontrak,
        required this.statusKontrak,
        required this.statusSksMencukupi,
        required this.statusBolehMerdeka,
        required this.kesimpulan,
    });

    factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        jumlahMahasiswaKontrak: json["jumlah_mahasiswa_kontrak"],
        idKelas: json["id_kelas"],
        kodeKelas: json["kode_kelas"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        hari: json["hari"],
        idSemester: json["id_semester"],
        semester: json["semester"],
        kapasitaas: json["kapasitaas"],
        ruangKuliah: RuangKuliah.fromJson(json["ruang_kuliah"]),
        kelasProdi: KelasProdi.fromJson(json["kelas_prodi"]),
        matakuliah: Matakuliah.fromJson(json["matakuliah"]),
        dosen: List<Dosen>.from(json["dosen"].map((x) => Dosen.fromJson(x))),
        statusKelas: json["status_kelas"],
        statusKapasitas: json["status_kapasitas"],
        statusJadwal: json["status_jadwal"],
        statusBisaDikontrak: json["status_bisa_dikontrak"],
        statusKontrak: json["status_kontrak"],
        statusSksMencukupi: json["status_sks_mencukupi"],
        statusBolehMerdeka: json["status_boleh_merdeka"],
        kesimpulan: json["kesimpulan"],
    );

    Map<String, dynamic> toJson() => {
        "jumlah_mahasiswa_kontrak": jumlahMahasiswaKontrak,
        "id_kelas": idKelas,
        "kode_kelas": kodeKelas,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "hari": hari,
        "id_semester": idSemester,
        "semester": semester,
        "kapasitaas": kapasitaas,
        "ruang_kuliah": ruangKuliah.toJson(),
        "kelas_prodi": kelasProdi.toJson(),
        "matakuliah": matakuliah.toJson(),
        "dosen": List<dynamic>.from(dosen.map((x) => x.toJson())),
        "status_kelas": statusKelas,
        "status_kapasitas": statusKapasitas,
        "status_jadwal": statusJadwal,
        "status_bisa_dikontrak": statusBisaDikontrak,
        "status_kontrak": statusKontrak,
        "status_sks_mencukupi": statusSksMencukupi,
        "status_boleh_merdeka": statusBolehMerdeka,
        "kesimpulan": kesimpulan,
    };
}

class Dosen {
    int idDosen;
    String namaDosen;
    String? gelarDepan;
    String gelarBelakang;

    Dosen({
        required this.idDosen,
        required this.namaDosen,
        this.gelarDepan,
        required this.gelarBelakang,
    });

    factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        idDosen: json["id_dosen"],
        namaDosen: json["nama_dosen"],
        gelarDepan: json["gelar_depan"],
        gelarBelakang: json["gelar_belakang"],
    );

    Map<String, dynamic> toJson() => {
        "id_dosen": idDosen,
        "nama_dosen": namaDosen,
        "gelar_depan": gelarDepan,
        "gelar_belakang": gelarBelakang,
    };
}

class KelasProdi {
    String namaKelasProdi;

    KelasProdi({
        required this.namaKelasProdi,
    });

    factory KelasProdi.fromJson(Map<String, dynamic> json) => KelasProdi(
        namaKelasProdi: json["nama_kelas_prodi"],
    );

    Map<String, dynamic> toJson() => {
        "nama_kelas_prodi": namaKelasProdi,
    };
}

class Matakuliah {
    String kodeMatakuliah;
    String namaMatakuliah;
    String sksTotal;

    Matakuliah({
        required this.kodeMatakuliah,
        required this.namaMatakuliah,
        required this.sksTotal,
    });

    factory Matakuliah.fromJson(Map<String, dynamic> json) => Matakuliah(
        kodeMatakuliah: json["kode_matakuliah"],
        namaMatakuliah: json["nama_matakuliah"],
        sksTotal: json["sks_total"],
    );

    Map<String, dynamic> toJson() => {
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "sks_total": sksTotal,
    };
}

class RuangKuliah {
    String namaRuang;

    RuangKuliah({
        required this.namaRuang,
    });

    factory RuangKuliah.fromJson(Map<String, dynamic> json) => RuangKuliah(
        namaRuang: json["nama_ruang"],
    );

    Map<String, dynamic> toJson() => {
        "nama_ruang": namaRuang,
    };
}
