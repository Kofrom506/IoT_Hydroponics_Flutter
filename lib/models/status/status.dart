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
            ph: double.tryParse(data["ph_value"].toString()) ?? 0.0,
            ec: double.tryParse(data["ec_value"].toString()) ?? 0.0,
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
