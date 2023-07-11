import 'package:flutter/material.dart';

class CardInfo {
  int id;
  String judul;

  String gambar;

  CardInfo(
      {required this.id,
      required this.judul,
     
      required this.gambar});
}

List<CardInfo> CardInfoList = [
  CardInfo(
      id: 1,
      judul: "Selamat Datang di ..\nSatu platform terintegrasi untuk mendukung berbagai layanan di UNJA",
      gambar: "wel.png"),
  CardInfo(
      id: 2,
      judul: "Informasi Terkini",
      gambar: "wel.png"),
  
];