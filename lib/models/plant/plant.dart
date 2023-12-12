// import 'package:uuid/uuid.dart';

import 'dart:convert';

class Plant {
  String id;
  String name;
  double? pHMin;
  double? pHMax;
  int? ecMin;
  int? ecMax;
  String imageName;
  String description;

  Plant({
    required this.id,
    required this.name,
    this.pHMin,
    this.pHMax,
    this.ecMin,
    this.ecMax,
    required this.imageName,
    required this.description,
  });

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "pHMin": pHMin,
      "pHMax": pHMax,
      "ecMin": ecMin,
      "ecMax": ecMax,
      "imageName": imageName,
      "description": description,
    };
  }

  String toJSON() {
    var value = toVariables();
    return jsonEncode(value);
  }

  static List<Plant> plantList = [
    Plant(
      id: "selada",
      name: "Selada",
      pHMin: 6,
      pHMax: 6.5,
      ecMin: 600,
      ecMax: 900,
      imageName: 'assets/plants/selada.png',
      description:
          "Sayuran daun hijau yang biasa digunakan sebagai bahan dalam salad. Selada kaya akan serat, vitamin, dan mineral.",
    ),
    Plant(
      id: "tomat",
      name: "Tomat",
      pHMin: 6,
      pHMax: 6.5,
      ecMin: 1000,
      ecMax: 2000,
      imageName: 'assets/plants/tomat.png',
      description:
          "Buah yang biasa dianggap sebagai sayuran, tomat memiliki warna merah cerah dan rasa yang manis serta sedikit asam. Tomat kaya akan vitamin C, karotenoid, dan likopen.",
    ),
    Plant(
      id: "kangkung",
      name: "Kangkung",
      pHMin: 5.5,
      pHMax: 6.5,
      ecMin: 600,
      ecMax: 1200,
      imageName: 'assets/plants/kangkung.png',
      description:
          "Sayuran air yang sering digunakan dalam masakan Asia Tenggara. Kangkung memiliki daun hijau dan batang berair serta kaya akan vitamin dan mineral seperti vitamin A, vitamin C, kalsium, dan besi.",
    ),
    Plant(
      id: "bayam",
      name: "Bayam",
      pHMin: 6,
      pHMax: 7,
      ecMin: 900,
      ecMax: 1150,
      imageName: "assets/plants/bayam.png",
      description:
          "Sayuran daun hijau yang biasa digunakan dalam masakan. Bayam kaya akan vitamin A, vitamin K, zat besi, dan kalsium.",
    ),
    Plant(
      id: "stroberi",
      name: "Stroberi",
      pHMin: 6,
      pHMax: 6.1,
      ecMin: 900,
      ecMax: 1100,
      imageName: 'assets/plants/strawberry.png',
      description:
          "Buah yang biasa dianggap sebagai sayuran, stroberi memiliki rasa manis dan asam dengan warna merah cerah. Stroberi kaya akan vitamin C, serat, dan antioksidan.",
    ),
    Plant(
      id: "pakcoy",
      name: "Pak Coy",
      pHMin: 7,
      pHMax: 7.1,
      ecMin: 750,
      ecMax: 1000,
      imageName: 'assets/plants/pakcoy.png',
      description:
          "Sayuran hijau yang sering digunakan dalam masakan Asia Tenggara dan Tionghoa. Pak coy kaya akan vitamin C, kalsium, dan zat besi.",
    ),
    Plant(
      id: "parsley",
      name: "Parsley",
      pHMin: 5.5,
      pHMax: 6,
      ecMin: 400,
      ecMax: 900,
      imageName: 'assets/plants/parsley.png',
      description:
          "Sayuran hijau yang sering digunakan sebagai bahan dalam masakan. Parsley kaya akan vitamin C, vitamin K, dan zat besi.",
    ),
    Plant(
      id: "kubis",
      name: "Kubis",
      pHMin: 6.5,
      pHMax: 7,
      ecMin: 1250,
      ecMax: 1500,
      imageName: 'assets/plants/kubis.png',
      description:
          "Sayuran yang berasal dari keluarga sawi-sawian. Kubis memiliki daun yang tebal dan kaya akan vitamin C, serat, dan antioksidan.",
    ),
    Plant(
      id: "brokoli",
      name: "Brokoli",
      pHMin: 6,
      pHMax: 6.8,
      ecMin: 1200,
      ecMax: 1750,
      imageName: 'assets/plants/brokoli.png',
      description:
          "Sayuran hijau yang sering digunakan dalam masakan. Brokoli kaya akan vitamin C, vitamin K, dan antioksidan seperti sulforaphane. Brokoli juga dikenal sebagai sayuran yang baik untuk kesehatan jantung dan pencegahan kanker.",
    ),
  ];
}

// final List<String> plantImages = [
//   'assets/plants/kangkung.png',
//   'assets/plants/selada.png',
//   'assets/plants/tomat.png',
//   'assets/plants/kangkung.png',
//   'assets/plants/strawberry.png',
//   'assets/plants/pakcoy.png',
//   'assets/plants/parsley.png',
//   'assets/plants/kubis.png',
//   'assets/plants/brokoli.png',
//   // Add more plant image URLs here
// ];

