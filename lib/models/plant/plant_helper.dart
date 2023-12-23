import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hydroponics/models/plant/plant.dart';

class PlantHelper {
  final instance = FirebaseFirestore.instance;

  Future<void> writeNow({required Plant plant}) async {
    await instance.collection('now').doc("now").set(plant.toVariables());
  }
}
