import 'package:uuid/uuid.dart';

class Plant {
  String id;
  String name;
  double pHMin;
  double pHMax;
  int ecMin;
  int ecMax;
  String imageName;
  String description;

  Plant({
    required this.name,
    required this.pHMin,
    required this.pHMax,
    required this.ecMin,
    required this.ecMax,
    required this.imageName,
    this.description,
  }) : id = Uuid().v4();

  static List<Plant> plantList = [
    Plant(
      name: "Selada",
      pHMin: 6,
      pHMax: 6.5,
      ecMin: 600,
      ecMax: 900,
      imageName: "selada",
      description: "Sayuran daun hijau yang biasa digunakan sebagai bahan dalam salad. Selada kaya akan serat, vitamin, dan mineral.",
    ),
    Plant(
      name: "Tomat",
      pHMin: 6,
      pHMax: 6.5,
      ecMin: 1000,
      ecMax: 2000,
      imageName: "tomat",
      description: "Buah yang biasa dianggap sebagai sayuran, tomat memiliki warna merah cerah dan rasa yang manis serta sedikit asam. Tomat kaya akan vitamin C, karotenoid, dan likopen.",
    ),
    Plant(
      name: "Kangkung",
      pHMin: 5.5,
      pHMax: 6.5,
      ecMin: 600,
      ecMax: 1200,
      imageName: "kangkung",
      description: "Sayuran air yang sering digunakan dalam masakan Asia Tenggara. Kangkung memiliki daun hijau dan batang berair serta kaya akan vitamin dan mineral seperti vitamin A, vitamin C, kalsium, dan besi.",
    ),
    Plant(
      name: "Bayam",
      pHMin: 6,
      pHMax: 7,
      ecMin: 900,
      ecMax: 1150,
      imageName: "bayam",
      description: "Sayuran daun hijau yang biasa digunakan dalam masakan. Bayam kaya akan vitamin A, vitamin K, zat besi, dan kalsium.",
    ),
    Plant(
      name: "Stroberi",
      pHMin: 6,
      pHMax: 6.1,
      ecMin: 900,
      ecMax: 1100,
      imageName: "stroberi",
      description: "Buah yang biasa dianggap sebagai sayuran, stroberi memiliki rasa manis dan asam dengan warna merah cerah. Stroberi kaya akan vitamin C, serat, dan antioksidan.",
    ),
    Plant(
      name: "Pak Coy",
      pHMin: 7,
      pHMax: 7.1,
      ecMin: 750,
      ecMax: 1000,
      imageName: "pakcoy",
      description: "Sayuran hijau yang sering digunakan dalam masakan Asia Tenggara dan Tionghoa. Pak coy kaya akan vitamin C, kalsium, dan zat besi.",
    ),
    Plant(
      name: "Parsley",
      pHMin: 5.5,
      pHMax: 6,
      ecMin: 400,
      ecMax: 900,
      imageName: "parsley",
      description: "Sayuran hijau yang sering digunakan sebagai bahan dalam masakan. Parsley kaya akan vitamin C, vitamin K, dan zat besi.",
    ),
    Plant(
      name: "Kubis",
      pHMin: 6.5,
      pHMax: 7,
      ecMin: 1250,
      ecMax: 1500,
      imageName: "kubis",
      description: "Sayuran yang berasal dari keluarga sawi-sawian. Kubis memiliki daun yang tebal dan kaya akan vitamin C, serat, dan antioksidan.",
    ),
    Plant(
      name: "Brokoli",
      pHMin: 6,
      pHMax: 6.8,
      ecMin: 1200,
      ecMax: 1750,
      imageName: "brokoli",
      description: "Sayuran hijau yang sering digunakan dalam masakan. Brokoli kaya akan vitamin C, vitamin K, dan antioksidan seperti sulforaphane. Brokoli juga dikenal sebagai sayuran yang baik untuk kesehatan jantung dan pencegahan kanker.",
    ),
  ];
}

}
