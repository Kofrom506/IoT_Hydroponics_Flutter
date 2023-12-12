import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hydroponics/extensions/future_extensions.dart';
import 'package:flutter_hydroponics/extensions/stream_extensions.dart';
import 'package:flutter_hydroponics/models/plant/plant.dart';
import 'package:flutter_hydroponics/models/progress/progress.dart';

class ProgressHelper {
  final instance = FirebaseFirestore.instance;
  Future<void> write({
    required Plant plant,
  }) async {
    DateTime now = DateTime.now();
    String id =
        "${plant.id}_${(999999999999999999 - now.millisecondsSinceEpoch)}";

    DateTime plantingDate = now.add(const Duration(days: 7));
    DateTime harvestingDate = plantingDate.add(const Duration(days: 31));

    Progress progress = Progress(
      harvestingDate: harvestingDate,
      id: id,
      plantId: plant.id,
      plantingDate: plantingDate,
      sowingDate: now,
      status: "on_going",
    );

    await instance
        .collection('progress')
        .doc(progress.id)
        .set(progress.toVariables());
  }

  Stream<Iterable<Progress?>> list() {
    var col = instance.collection('progress');
    var snapshot = col.snapshots();
    var result = snapshot.mapList(Progress.fromMap);
    return result;
  }

  Future<Iterable<Progress?>> listFuture() async {
    var col = instance.collection('progress');
    var snapshot = col.get();
    var result = snapshot.mapQuery<Progress>((p0) => Progress.fromMap(p0), []);
    return result;
  }
}
