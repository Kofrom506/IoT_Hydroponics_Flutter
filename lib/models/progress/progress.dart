// import 'package:uuid/uuid.dart';

import 'dart:convert';

class Progress {
  String id;
  String plantId;
  String status;
  DateTime harvestingDate;
  DateTime plantingDate;
  DateTime sowingDate;

  Progress({
    required this.id,
    required this.plantId,
    required this.status,
    required this.sowingDate,
    required this.harvestingDate,
    required this.plantingDate,
  });
  static Progress? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Progress(
            id: data["id"] ?? "",
            harvestingDate:
                DateTime.tryParse(data["harvesting_date"]) ?? DateTime.now(),
            plantingDate:
                DateTime.tryParse(data["planting_date"]) ?? DateTime.now(),
            sowingDate:
                DateTime.tryParse(data["sowing_date"]) ?? DateTime.now(),
            status: data["status"] ?? "",
            plantId: data["plant_id"] ?? "",
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "harvesting_date": harvestingDate.toIso8601String(),
      "planting_date": plantingDate.toIso8601String(),
      "sowing_date": sowingDate.toIso8601String(),
      "status": status,
      "plant_id": plantId,
    };
  }

  String toJSON() {
    var value = toVariables();
    return jsonEncode(value);
  }
}
