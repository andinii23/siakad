// To parse this JSON data, do
//
//     final krsOutboundModel = krsOutboundModelFromJson(jsonString);

import 'dart:convert';

KrsOutboundModel krsOutboundModelFromJson(String str) => KrsOutboundModel.fromJson(json.decode(str));

String krsOutboundModelToJson(KrsOutboundModel data) => json.encode(data.toJson());

class KrsOutboundModel {
    String uuidPtAsal;
    String kodePt;
    String namaPt;
    dynamic createdAt;
    String updatedAt;
    String singkatan;
    String npsn;
    String status;

    KrsOutboundModel({
        required this.uuidPtAsal,
        required this.kodePt,
        required this.namaPt,
        this.createdAt,
        required this.updatedAt,
        required this.singkatan,
        required this.npsn,
        required this.status,
    });

    factory KrsOutboundModel.fromJson(Map<String, dynamic> json) => KrsOutboundModel(
        uuidPtAsal: json["uuid_pt_asal"],
        kodePt: json["kode_pt"],
        namaPt: json["nama_pt"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        singkatan: json["singkatan"],
        npsn: json["npsn"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "uuid_pt_asal": uuidPtAsal,
        "kode_pt": kodePt,
        "nama_pt": namaPt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "singkatan": singkatan,
        "npsn": npsn,
        "status": status,
    };

    @override

    String toString() => namaPt;
}
