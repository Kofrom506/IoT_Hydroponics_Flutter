import 'dart:convert';

class Status {
  double ph;
  double ec;

  Status({
    required this.ph,
    required this.ec,
  });
  static Status? fromMap(Map<String, dynamic>? data) {
    return data == null
        ? null
        : Status(
            ph: data["ph_value"] ?? 0,
            ec: data["ec_value"] ?? 0,
          );
  }

  Map<String, dynamic> toVariables() {
    return {
      "ph_value": ph,
      "ec_value": ec,
    };
  }

  String toJSON() {
    var value = toVariables();
    return jsonEncode(value);
  }
}
