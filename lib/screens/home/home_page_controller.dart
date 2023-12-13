import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hydroponics/models/progress/progress_helper.dart';
import 'package:flutter_hydroponics/models/progress/progress.dart';
import 'package:get/get.dart' hide Progress;

class HomePageController extends GetxController {
  var data = <Map<String, dynamic>>[].obs;

  var listProgress = <Progress?>[].obs;

  var isLoading = true.obs;
  var isLoadingLatest = true.obs;

  var number = 0.obs;
  // var isLoadingImage = true.obs;

  // Weather weatherData = Weather();
  // DataNow dataNow = DataNow(personCount: 0, dateTime: DateTime.now());

  double lat = -6.359897830104273;
  final double lon = 106.82723430001242;
  final String city = "Depok";
  final String country = "Indonesia";

  var uri =
      "https://api.openweathermap.org/data/2.5/weather?lat=-6.359897830104273&lon=106.82723430001242&appid=2b7f68fc45158a3eecc242be3998ac85&q=Depok&country=Indonesia&mode=json&units=metric";

  @override
  void onInit() async {
    isLoading(true);

    super.onInit();
    await fetchData();
    await fetchDataNow();
    print("Evan");

    isLoading(false);
  }

  Future<void> fetchData() async {
    try {
      var dates = await ProgressHelper().listFuture();
      var send = dates.toList();
      send.sort(
        (a, b) {
          return a!.harvestingDate.compareTo(b!.harvestingDate);
        },
      );
      listProgress.assignAll(send);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {}
  }

  Future<void> fetchDataNow() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('data').get();
      data.assignAll(snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList());

      print(data);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {}
  }
}

class DataNow {
  final double? ec;
  final double? ph;

  DataNow({
    this.ec,
    this.ph,
  });
}
